import parser = require("query-string");
import moment = require("moment");
import React = require("react");
import { connect } from "react-redux";
import { Table, Button, Checkbox } from "react-bootstrap";
import Signal from "./Signal";
import { SammaryRow } from "./Sammary";
import HighStock from "./Chart";
import { getFavorites, setFavorites, delFavorites } from "./Cookie";
import * as I from "./Interface";
import * as DummyData from "./DummyData";
import { setList, sortListByRatio } from "./Action";

type FilterKey = I.SignalKey | I.SignalType;
const filterKeys = [].concat(I.SignalKeys).concat(I.SignalTypes) as FilterKey[];

type Signals = { [k in FilterKey]: boolean };

class Filter extends React.Component<{ parent: List }, Signals> {
  private parent: List;

  constructor(props) {
    super(props);
    this.parent = props.parent;
    const keys = [].concat(I.SignalKeys).concat(I.SignalTypes) as FilterKey[];
    this.state = keys.map(k => ({ [k]: false })).reduce(Object.assign, {});
    // this.state = keys.map(k => ({ [k]: false })).reduce((acc, x) => Object.assign(acc, x));
  }

  filter(e, k) {
    this.setState({ [k]: e.target.checked }, () => {
      this.parent.setState({ signals: this.state, page: 0 });
    });
  }

  render() {
    return (
      <div>
        {filterKeys.map((k, i) =>
          <Checkbox inline key={i} onClick={e => this.filter(e, k)}>
            {k}
          </Checkbox>
        )}
      </div>
    );
  }
}

interface Props {}

interface State {
  parent: any;
  signals: Signals;
  favorites: string[];
  page: number;
  per_page: number;
  order_by?: string;
  desc: boolean;
  chart: boolean;
  from: string;
  favorite: boolean;
  codes: string[];
}

class List extends React.Component<Props, State> {
  constructor(props) {
    const qs = parser.parse(window.location.search);
    super(props);
    this.state = {
      parent: props.parent,
      signals: {} as Signals,
      favorites: getFavorites(),
      page: Number(qs.page) || 0,
      per_page: Number(qs.per_page) || 20,
      order_by: qs.order_by,
      desc: qs.desc !== undefined,
      chart: qs.chart !== undefined,
      from: qs.from || moment().subtract(1, "months").format("YYYYMMDD"),
      favorite: qs.favorite !== undefined,
      codes: qs.codes === undefined ? [] : typeof(qs.codes) === "string" ? [qs.codes] : qs.codes,
    };
  }

  componentDidUpdate() {
    const {page, per_page, chart, order_by, from, favorite, codes} = this.state;
    const f = (x: any) => !!x ? null : undefined;
    const p = parser.stringify({page, per_page, chart: f(chart) , favorite: f(favorite), from, order_by: order_by, codes});
    window.history.pushState({}, "title", "/chart?" + p);
  }

  updateCodes() {
    !__MOCK__ && this.props.setList({wait: true, ...this.state, codes: this.getCodes()});
  }

  getCodes() {
    return this.state.favorite ? getFavorites() : this.state.codes;
  }

  componentDidMount() {
    this.updateCodes()
  }

  handlePaging(page: number) {
    const { per_page } = this.state;
    this.setState({ page }, () => {
      this.props.setList({...this.state, codes: this.getCodes()});
    });
  }

  setFavorites(code: string) {
    this.setState({ favorites: setFavorites(code) });
  }

  delFavorites(code: string) {
    this.setState({ favorites: delFavorites(code) });
  }

  showRow(r) {
    const html = [<SammaryRow key={r.code} code={r} parent={this} />];
    if (this.state.chart) {
        html.push(
            <tr><td colSpan={6}>
              <HighStock chart={{ohlc: r.prices, code: r.code}} lazy={true} />
            </td></tr>
        );
    }
    return html;
  }

  render() {
    const rows = __MOCK__ ? DummyData.codes : this.props.codes;
    const { page, per_page } = this.state;
    const start = page * per_page;
    const end = start + per_page;
    const lastPage = parseInt(this.props.state.chart.count / per_page);
    return (
      <div>
        <Filter parent={this} />
        <Button bsSize="xsmall" onClick={() => this.handlePaging(page - 1)} disabled={page == 0}>
          PREV
        </Button>
        <Button bsSize="xsmall" onClick={() => this.handlePaging(page + 1)} disabled={false}>
          NEXT
        </Button>{" "}
        {page} {lastPage > 0 && `/ ${lastPage}`}
        <Button bsSize="xsmall" bsStyle={this.state.favorite ? "info" : "default"} onClick={() => this.setState({favorite: !this.state.favorite}, () => this.handlePaging(0))}>FAVORITES</Button>
        <Button bsSize="xsmall" bsStyle={this.state.chart ? "info" : "default"} onClick={() => this.setState({chart: !this.state.chart}, () => this.handlePaging(this.state.page))}>CHART</Button>
        <Table striped bordered condensed hover>
          <thead>
            <tr>
              <th>CODE</th>
              <th>PRICE</th>
              <th onClick={this.props.sort.bind(this)}>CHANGE(%)</th>
              <th>SIGNALS</th>
              <th>PREDICTION</th>
              <th>FAVORITES</th>
            </tr>
          </thead>
          <tbody>
            {rows.map(r => this.showRow(r))}
          </tbody>
        </Table>
      </div>
    );
  }
}



const mapStateToProps = state => ({
  codes: state.chart.codes,
  state: state,
});
const mapDispatchToProps = dispatch => ({
  setList: (p) => dispatch(setList(p)),
  sort: () => dispatch(sortListByRatio()),
});
export default connect(mapStateToProps, mapDispatchToProps)(List);
