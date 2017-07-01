import React = require("react");
import ReactHighstock = require("react-highcharts/ReactHighstock.src");
import parser = require("query-string");

interface Series {
  quandl_code: string;
  series: number[]; // [[date, price]]
}

interface yLine {
  name: string;
  value: number; // [[date, price]]
}

interface State {
  socket: WebSocket;
  series: any[];
  yLines: any[];
  code: string;
  codes: string[];
  errorMsg: string;
}

const map = A => {
  if (Object.keys(A).length === 0){
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
      code: qs.code || "TSE/1301",
      codes: [],
      errorMsg: "",
    };
  }

  componentDidMount() {
    let socket = this.state.socket;
    socket.onopen = () => {
       socket.send(JSON.stringify(map({...this.state.qs, code: this.state.code})));
    };
    socket.onmessage = m => {
      const data = JSON.parse(m.data);
      if (data.event == "set_codes") {
        this.setState({codes: data.codes});
        return;
      }

      const s = data.series;
      console.log(data);
      if ("volume" in data) {
        this.showVolumn(data.volume);
      }

      const CANDLE_KEYS = ["open", "high", "low", "close"];
      if (CANDLE_KEYS.map(k => k in data).every(x => x)) {
        this.showOHLC(data);
      } else if (s instanceof Array) {
        this.showSeries(data);
      } else if (typeof s == "number") {
        this.showPriceOnY({ value: s, text: data.name });
      } else {
        console.log(`UNKNOWN: ${s} (${typeof s})`);
      }
    };

    socket.onerror = e => {
      console.log(e);
      this.setState({ errorMsg: "SOME ERROR HAPPENS" });
    };
  }

  showVolumn(volume: number[]) {
    const data = volume.map((d, i) => [d[0] * 1000, d[1]]);
    const d = { name: "volume", data, type: "column", yAxis: 1 };
    this.setState({ series: this.state.series.concat(d) });
  }

  showOHLC(data: any) {
    // TOOD: refactor with zip
    const series = data.open.map((d, i) => [d[0] * 1000, d[1], data.high[i][1], data.low[i][1], data.close[i][1]]);
    const d = {
      type: "candlestick",
      data: series,
    };
    this.setState({ series: this.state.series.concat(d) });
  }

  showSeries({ series, quandl_code, chart_type = ""}: Series) {
    let yAxis = 0;
    let lineWidth = 1;
    let name = quandl_code;
    let color = "blue";
    if (chart_type.startsWith("stochastic")) {
      yAxis = 4;
    } else if (chart_type.startsWith("rsi")) {
      yAxis = 2;
      name = "RSI"
   } else if (chart_type.startsWith("macd")) {
      yAxis = 3;
      name = "MACD"
   } else if (chart_type.startsWith("bollinger_band")) {
      name = chart_type 
      color = "black"
      lineWidth = 0.5
    }
    series = series.map(d => [d[0] * 1000, d[1]]); // needs to convert millisecond
    const d = {
      type: "line",
      data: series,
      lineWidth,
      yAxis,
      name,
      color,
    };
    this.setState({ series: this.state.series.concat(d) });

    const min = Math.min(...series.map(e => e[1]));
    // this.showPriceOnY({ value: min, text: "min" });
    const max = Math.max(...series.map(e => e[1]));
    // this.showPriceOnY({ value: max, text: "max" });
  }

  showPriceOnY({ value, text }) {
    let series = this.state.series;
    this.setState({
      yLines: this.state.yLines.concat({
        value,
        label: { text: `${text} (${value})` },
        dashStyle: "shortdash",
        color: "#FF00FF",
        width: 2,
      }),
    });
  }

  getConfig() {
    return {
      chart: { height: 500 },
      rangeSelector: { selected: 1 },
      yAxis: [
        { title: { text: "OHLC" }, height: "60%", plotLines: this.state.yLines },
        { title: { text: "Volume" }, height: "10%", top: "60%" },
        { title: { text: "RSI" }, height: "10%", top: "80%" },
        { title: { text: "MACD" }, height: "10%", top: "90%" },
        { title: { text: "stochastic" }, height: "10%", top: "70%" },
      ],
      series: this.state.series,
    };
  }

  selectCode(e) {
    const code = e.target.value
    this.setState({code, series: [], yLines: []});
    this.state.socket.send(JSON.stringify({code}))
  }

  render() {
    const { errorMsg } = this.state;
    return (
      <div>
        {errorMsg && <div>{errorMsg}</div>}
        <select value={this.state.code} onChange={e => this.selectCode(e)}>
          {this.state.codes.map((c, i) => <option key={i}>{c}</option>)}
        </select>
        <ReactHighstock config={this.getConfig()} />
      </div>
    );
  }
}

export default Chart;

/*
   # tooltip={valueDecimals: 2}
        return bbands + [
            {"name": "RSI", "data": self.RSI(period=14), "yAxis": 2},
            {"name": "macd_line", "data": self.macd_line(), "yAxis": 3},
            {"name": "macd_signal", "data": self.macd_signal(), "yAxis": 3},
        ]
*/
