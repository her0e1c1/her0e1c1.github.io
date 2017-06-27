import React = require("react");
import ReactHighstock = require("react-highcharts/ReactHighstock.src");
import parser = require("query-string");

/*
class Message extends React.Component {

  constructor(props) {
    super(props)
    const channel = props.channel
    this.state = {
      channel: props.channel,
      events: props.events || [],
      children: [],
      data: [],
      buy_price: null,
    }
  }

  componentDidMount() {
    const {channel, events} = this.state
    const qs = parser.parse(window.location.search)
    let code = ""
    if (qs.code) {
      code = qs.code
    }
    if (qs.bp) {
        this.setState({buy_price: qs.bp})
    }
    channel.push(events[0], {body: code}, 10000)

    events.map(e => {
      channel.on(e, (msg) => {
        console.log(msg)
        this.setState({data: msg.data})
      })
    })

  }

  render() {
    const {children, channel, events, buy_price} = this.state
    let data = this.state.data.map(e => {
      e[0] = new Date(e[0]).getTime();
      return e
    })
    console.log(data)
    var config = {
      rangeSelector: {
        selected: 1
      },
      title: {
        text: 'Stock Price'
      },
      yAxis: {
        // max: Math.max(data.map(e => e[1])),
        //* min: Math.min(data.map(e => e[1])),
        plotLines: [{
          value: buy_price || -1,
          color: 'green',
          dashStyle: 'shortdash',
          width: 2,
          label: {
            text: 'test'
          }
        }]
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

// TODO: JOINボタン
class Topic extends React.Component {
  constructor(props) {
    super(props)
    if (props.socket == undefined)
      throw "Undefined socket";
    this.state = {
      socket: props.socket,
      topic: props.topic,
      events: props.events || [],
      channel: null,
    }
    this.handleClick = this.handleClick.bind(this);
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
  yLines: any[],
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
    let socket = new WebSocket(__PYSTOCK_HOST__);
    socket.onopen = () => {
      const qs = parser.parse(window.location.search);
      socket.send(JSON.stringify(map(qs)));
    };
    socket.onmessage = m => {
      const data = JSON.parse(m.data);
      const s = data.series;
      // console.log(data)
      if (s instanceof Array) {
        this.showSeries(data);
      } else if (typeof s == "number") {
        this.showPriceOnY(s);
      } else {
        console.log(`UNKNOWN: ${s} (${typeof s})`);
      }
    };
    socket.onerror = e => {
      console.log(e);
      this.setState({ errorMsg: "SOME ERROR HAPPENS" });
    };

    this.state = {
      series: [],
      yLines: [],
      errorMsg: "",
      socket,
    };
  }

  showSeries({series, quandl_code}: Series) {
    series = series.map(d => [d[0] * 1000, d[1]])  // needs to convert millisecond
    const d = {
      type: "line",
      name: quandl_code,
      data: series,
    };
    this.setState({ series: this.state.series.concat(d) });
  }

  showPriceOnY(price: number) {
    let series = this.state.series;
    this.setState({
      yLines: this.state.yLines.concat({
        value: price,
        color: "#FF00FF",
        width: 2,
        label: {
          text: "price",
        },
      }),
    });
  }

  getConfig() {
    return {
      yAxis: {
        plotLines: this.state.yLines,
      },
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
$('#container').highcharts('StockChart', {
    chart: {height: 1000},
    rangeSelector: {selected: 1},
    yAxis: [
        {title: {text: 'OHLC'}, height: '60%'},
        {title: {text: 'Volume'}, height: '10%', top: '60%'},
        {title: {text: 'RSI'}, height: '10%', top: '80%'},
        {title: {text: 'MACD'}, height: '10%', top: '90%'},
        {title: {text: 'stochastic'}, height: '10%', top: '70%'},
    ],
    series : data.series
});
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
            {"name": "OHLC", "data": self.ohlc(), "type": "candlestick", "yAxis": 0, "color": 'blue'},
            {"name": "volume", "data": self.volume(), "type": "column", "yAxis": 1},
            {"name": "RSI", "data": self.RSI(period=14), "yAxis": 2},
            {"name": "macd_line", "data": self.macd_line(), "yAxis": 3},
            {"name": "macd_signal", "data": self.macd_signal(), "yAxis": 3},
            {"name": "%K", "data": self.stochastic_k(), "yAxis": 4},
            {"name": "%D", "data": self.stochastic_d(), "yAxis": 4},
            {"name": "%SD", "data": self.stochastic_sd(), "yAxis": 4},
        ]
*/
