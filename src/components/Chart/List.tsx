import React = require("react");
import { Table, Button, Checkbox } from "react-bootstrap";
import Signal from "./Signal";
import * as C from "./Const";

interface Props {}

interface State {
  parent: any;
  rows: any[];
  signals: string[];
}

class Filter extends React.Component<Props, State> {
  constructor(props) {
    super(props);
    this.parent = props.parent;
    this.state = C.SIGNAL_KEYS.map(k => ({ [k]: false })).reduce((acc, x) => Object.assign(acc, x), {});
  }

  filter(e, k) {
    this.setState({ [k]: e.target.value === "on" }, () => this.parent.setState({ signals: this.state }));
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

class List extends React.Component<Props, State> {
  constructor(props) {
    super(props);
    this.state = {
      parent: props.parent,
      rows: [],
      signals: {},
    };
  }

  componentDidMount() {
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

  filterRow(row) {
    const ss = this.state.signals;
    return Object.keys(ss).some(k => ss[k] && !!row.signal[k]);
  }

  render() {
    return (
      <Table responsive>
        <thead>
          <Filter parent={this} />
          <tr>
            <th>CODE</th>
            <th>PRICE</th>
            <th>DIFF</th>
          </tr>
        </thead>
        <tbody>
          {this.state.rows.filter(this.filterRow.bind(this)).map((r, i) =>
            <tr key={i}>
              <td>
                <a href={`/?path=chart&code=${r.code}`}> {r.code} </a>{" "}
              </td>
              <td>
                {r.price && r.price.close}
              </td>
              <td>
                <Signal signal={r.signal} />
              </td>
            </tr>
          )}
        </tbody>
      </Table>
    );
  }
}

export default List;
