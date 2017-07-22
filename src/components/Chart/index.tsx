import React = require("react");
import parser = require("query-string");
import List from "./List";
import HighStock from "./Chart";

interface State {
  socket: WebSocket;
  series: any[];
  yLines: any[];
  lastClose?: number;
  lastCloseDiff?: number;
  code: string;
  codes: string[];
  errorMsg: string;
}

const map = A => {
  if (Object.keys(A).length === 0) {
    return [];
  }
  const f = (acc, k) => {
    let a = [];
    acc.forEach(x => {
      let ss = A[k] instanceof Array ? A[k] : [A[k]];
      ss.forEach(s => a.push(Object.assign({}, x, { [k]: s })));
    });
    return a;
  };
  return Object.keys(A).reduce(f, [[]]);
};

class Chart extends React.Component<null, State> {
  constructor(props) {
    super(props);
    const qs = parser.parse(window.location.search);
    this.state = {
      qs,
      socket: new WebSocket(__PYSTOCK_HOST__),
      series: [],
      yLines: [],
      lastClose: null,
      code: qs.code || "TSE/1301",
      codes: [],
      signal: null,
      errorMsg: "",
    };
  }

  componentDidMount() {
    let socket = this.state.socket;
    socket.onopen = () => {
      socket.send(JSON.stringify(map({ ...this.state.qs, code: this.state.code })));
    };
    socket.onmessage = m => {
      const data = JSON.parse(m.data);
      if (data.event == "signal") {
        this.setState({ signal: data.signal });
        return;
      }
      if (data.event == "set_codes") {
        this.setState({ codes: data.codes });
        return;
      }
    };

    socket.onerror = e => {
      console.log(e);
      this.setState({ errorMsg: "SOME ERROR HAPPENS" });
    };
  }

  // const min = Math.min(...series.map(e => e[1]));
  // this.showPriceOnY({ value: min, text: "min" });

  selectCode(e) {
    const code = e.target.value;
    this.setState({ code, series: [], yLines: [] });
    this.state.socket.send(JSON.stringify({ code }));
  }

  render() {
    const { errorMsg } = this.state;
    return (
      <div>
        <HighStock />
        <List parent={this} />

        {errorMsg &&
          <div>
            {" "}{errorMsg}{" "}
          </div>}

        <select value={this.state.code} onChange={e => this.selectCode(e)}>
          {this.state.codes.map((c, i) =>
            <option key={i}>
              {c}
            </option>
          )}
        </select>
      </div>
    );
  }
}

export default Chart;
