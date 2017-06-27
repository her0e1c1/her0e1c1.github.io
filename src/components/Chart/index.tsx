import React = require("react");
import ReactHighstock = require("react-highcharts/ReactHighstock.src");
import parser = require("query-string");

/*
      },
      series: [{
        name: 'price',
        data: data,
        type: "candlestick", // [timestamp, open, high, low, close]
        tooltip: {
          valueDecimals: 2
        }
      }]
    };
    return (
      <div>
        <ReactHighstock config={config} />
      </div>
    )}
}
*/

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
  errorMsg: string;
}

const map = A => {
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
    this.state = {
      socket: new WebSocket(__PYSTOCK_HOST__),
      series: [],
      yLines: [],
      errorMsg: "",
    };
  }

  componentDidMount() {
    let socket = this.state.socket;
    socket.onopen = () => {
      const qs = parser.parse(window.location.search);
      socket.send(JSON.stringify(map(qs)));
    };
    socket.onmessage = m => {
      const data = JSON.parse(m.data);
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

  showSeries({ series, quandl_code }: Series) {
    series = series.map(d => [d[0] * 1000, d[1]]); // needs to convert millisecond
    const d = {
      type: "line",
      name: quandl_code,
      data: series,
    };
    this.setState({ series: this.state.series.concat(d) });

    const min = Math.min(...series.map(e => e[1]));
    this.showPriceOnY({ value: min, text: "min" });
    const max = Math.max(...series.map(e => e[1]));
    this.showPriceOnY({ value: max, text: "man" });
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

  render() {
    const { errorMsg } = this.state;
    return (
      <div>
        {errorMsg && <div>{errorMsg}</div>}
        <ReactHighstock config={this.getConfig()} />
      </div>
    );
  }
}

export default Chart;

/*
bbands = [{"name": "%dsigma" % s,
            "data": self.bollinger_band(sigma=s),
            "color": "black",
            "yAxis": 0,
            "lineWidth": 0.5}
            for s in [3, 2, 1, -1, -2, -3]]
   # tooltip={valueDecimals: 2}
        return bbands + [
            {"name": "rolling_mean25", "data": self.rolling_mean(period=25)},
            {"name": "rolling_mean5", "data": self.rolling_mean(period=5)},
            {"name": "RSI", "data": self.RSI(period=14), "yAxis": 2},
            {"name": "macd_line", "data": self.macd_line(), "yAxis": 3},
            {"name": "macd_signal", "data": self.macd_signal(), "yAxis": 3},
            {"name": "%K", "data": self.stochastic_k(), "yAxis": 4},
            {"name": "%D", "data": self.stochastic_d(), "yAxis": 4},
            {"name": "%SD", "data": self.stochastic_sd(), "yAxis": 4},
        ]
*/
