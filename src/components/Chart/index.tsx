import React = require('react');
import ReactHighstock = require('react-highcharts/ReactHighstock.src')
import parser = require('query-string');
import { Socket } from 'src/phoenix.js'
import { PhoenixClient } from 'src/components/PhoenixClient';

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
        /* max: Math.max(data.map(e => e[1])),
         * min: Math.min(data.map(e => e[1])),*/
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

  componentWillMount() {
      this.join(this.state)
  }

  join({topic}) {
    if (topic == null) return
    let channel = this.state.socket.channel(topic)
    this.setState({channel})
    channel.join()
      .receive("ok", (resp) => {
        console.log("catching up", resp);
      })
      .receive("error", ({reason}) => console.log("failed join", reason) )
      .receive("timeout", () => console.log("Networking issue. Still waiting...") )
  }
  
  handleClick(e) {
    if (this.state.channel != null) return;
    this.join(this.state)
  }

  render() {
    const {topic, events, channel} = this.state
    let showMessage = channel != null 
    return (
      <div style={{ border: "1px solid black" }}>
        {showMessage && <Message channel={channel} events={events}/>}
    </div>
    )}
}

class Chart extends React.Component {

  constructor(props) {
    super(props)
    const socket = new Socket(__WEBSOCKET_URL__)
    socket.connect()
    socket.onError(e => console.log(e))
    socket.onClose(() => console.log("the connection dropped"))
    this.state = {socket}
  }

  render() {
    const {socket} = this.state
    return (
      <div>
        <Topic socket={socket} topic={"chat:client"} events={["test"]} />
      </div>
    )}
}

export = Chart

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
