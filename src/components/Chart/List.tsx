import React = require("react");
import { Table, Button, Checkbox } from "react-bootstrap";
import Signal from "./Signal";
import { SammaryRow } from "./Sammary";
import * as C from "./Const";
import * as I from "./Interface";
import * as DummyData from "./DummyData";

class Filter extends React.Component<Props, State> {
  constructor(props) {
    super(props);
    this.parent = props.parent;
    this.state = I.SignalKeys.map(k => ({ [k]: false })).reduce((acc, x) => Object.assign(acc, x), {});
  }

  filter(e, k) {
    this.setState({ [k]: e.target.checked }, () => this.parent.setState({ signals: this.state, page: 0 }));
  }

  render() {
    return (
      <div>
        {C.SIGNAL_KEYS.map((k, i) =>
          <Checkbox inline key={i} onClick={e => this.filter(e, k)}>
            {k}
          </Checkbox>
        )}
      </div>
    );
  }
}

interface Props {}

type Signals = {
  [k in I.SignalType]: boolean;
}

interface State {
  parent: any;
  rows: I.Code[];
  signals: Signals; 
  page: number;
  perPage: number;
}

class List extends React.Component<Props, State> {
  constructor(props) {
    super(props);
    this.state = {
      parent: props.parent,
      rows: __MOCK__ ? DummyData.codes : [],
      signals: {},
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
    return Object.keys(s).some(k => s[k] && !!row.signal[k]);
  }

  render() {
    const {page, perPage, rows} = this.state;
    const start = page * perPage;
    const end = start + perPage;
    const checked = Object.keys(this.state.signals).some(k => this.state.signals[k]);
    const filtered = !checked ? rows : rows.filter(r => this.filterRow(r))
    const paging = filtered.slice(start, end);
    return (
      <div>
      <Filter parent={this} />
      <Button bsSize="xsmall" onClick={() => this.setState({page: page - 1})} disabled={page == 0}>PREV</Button> 
      <Button bsSize="xsmall" onClick={() => this.setState({page: page + 1})} disabled={end > filtered.length}>NEXT</Button> 
      <Table striped bordered condensed hover>
        <thead>
          <tr>
            <th>CODE</th>
            <th>PRICE</th>
            <th>DIFF</th>
            <th>SIGNALS</th>
            <th>SCORE</th>
          </tr>
        </thead>
        <tbody>
          {paging.map((r) => <SammaryRow key={r.code} code={r} />)}
        </tbody>
      </Table>
      </div>
    );
  }
}

export default List;
