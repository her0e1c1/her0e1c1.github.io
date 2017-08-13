import parser = require("query-string");
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

type FilterKey = I.SignalKey | I.SignalType | "favorites";
const filterKeys = ["favorites"].concat(I.SignalKeys).concat(I.SignalTypes) as FilterKey[];

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
    this.setState({ [k]: e.target.checked }, () => this.parent.setState({ signals: this.state, page: 0 }));
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
    };
  }

  componentDidMount() {
    !__MOCK__ && this.props.setList({wait: true, ...this.state});
  }

  filterRow(row: I.Code): boolean {
    const s = this.state.signals;
    if (s.favorites) {
      if (this.state.favorites.indexOf(row.code) === -1) {
        return false;
      }
      if (!filterKeys.filter(k => k !== "favorites").some(k => this.state.signals[k])) {
        return true;
      }
    } else {
      if (!filterKeys.some(k => this.state.signals[k])) {
        return true;
      }
    }
    return I.SignalKeys.some(k => {
      const bs = row.signal[k] as I.SignalType;
      if (s.BUY || s.SELL) {
        if (s.BUY && bs === "BUY") {
          return true;
        }
        if (s.SELL && bs === "SELL") {
          return true;
        }
        return false;
      } else {
        if (!s[k]) {
          return false;
        }
        return !!bs;
      }
    });
  }

  handlePaging(page: number) {
    const { per_page } = this.state;
    this.setState({ page }, () => {
      if (page * per_page >= this.props.codes.length)
        this.props.setList({...this.state});
    }
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
    const filtered = rows.filter(r => this.filterRow(r));
    const paging = filtered.slice(start, end);
    const lastPage = parseInt(filtered.length / per_page);
    return (
      <div>
        <Filter parent={this} />
        <Button bsSize="xsmall" onClick={() => this.handlePaging(page - 1)} disabled={page == 0}>
          PREV
        </Button>
        <Button bsSize="xsmall" onClick={() => this.handlePaging(page + 1)} disabled={end > filtered.length}>
          NEXT
        </Button>{" "}
        {page} / {lastPage} [{filtered.length}]
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
            {paging.map(r => this.showRow(r))}
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
