import React = require("react");
import { Table, Button, Checkbox } from "react-bootstrap";
import Signal from "./Signal";
import { SammaryRow } from "./Sammary";
import { getFavorites, setFavorites, delFavorites } from "./Cookie";
import * as I from "./Interface";
import * as DummyData from "./DummyData";

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
  rows: I.Code[];
  signals: Signals;
  favorites: string[];
  page: number;
  perPage: number;
}

class List extends React.Component<Props, State> {
  constructor(props) {
    super(props);
    this.state = {
      parent: props.parent,
      rows: __MOCK__ ? DummyData.codes : [],
      signals: {} as Signals,
      favorites: getFavorites(),
      page: 0,
      perPage: 10,
    };
  }

  componentDidMount() {
    if (__MOCK__) return;
    const socket = this.state.parent.state.socket;
    socket.addEventListener("open", () => {
      socket.send(JSON.stringify({ event: "list" }));
    });
    socket.addEventListener("message", m => {
      const data = JSON.parse(m.data);
      if (data.event !== "list") {
        return;
      }
      this.setState({ rows: data.codes });
    });
  }

  filterRow(row: I.Code): boolean {
    const s = this.state.signals;
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

  render() {
    const { page, perPage, rows } = this.state;
    const start = page * perPage;
    const end = start + perPage;
    const checked = filterKeys.some(k => !!this.state.signals[k]);
    const filtered = !checked ? rows : rows.filter(r => this.filterRow(r));
    const paging = filtered.slice(start, end);
    return (
      <div>
        <Filter parent={this} />
        <Button bsSize="xsmall" onClick={() => this.setState({ page: page - 1 })} disabled={page == 0}>
          PREV
        </Button>
        <Button bsSize="xsmall" onClick={() => this.setState({ page: page + 1 })} disabled={end > filtered.length}>
          NEXT
        </Button>
        <Table striped bordered condensed hover>
          <thead>
            <tr>
              <th>CODE</th>
              <th>PRICE</th>
              <th>DIFF (RATIO)</th>
              <th>SIGNALS</th>
              <th>SCORE</th>
              <th>FAVORITES</th>
            </tr>
          </thead>
          <tbody>
            {paging.map(r => <SammaryRow key={r.code} code={r} parent={this} />)}
          </tbody>
        </Table>
      </div>
    );
  }
}

export default List;
