import _ = require("lodash");
import React = require("react");
import ReactHighstock = require("react-highcharts/ReactHighstock.src");
import * as I from "./Interface";
import * as DummyData from "./DummyData";

interface State extends I.Chart {}

class Chart2 extends React.Component<null, State> {
  constructor(props) {
    super(props);
    const s = DummyData.prices.map(x => [x.date, x.close + 1000]);
    this.state = {
      code: props.code || "TSE/1301",
      rsi: {line: s},
      ohlc: [] // DummyData.prices,
    };
  }

  getConfig() {
    const {ohlc, rsi} = this.state
    let series = [];
    let yAxis = [];
    // if (ohlc) {
    //   yAxis.push({name: "OHLC", height: "50%"});
    //   series.push({
    //       type: "candlestick",
    //       yAxis: 0,
    //       data: ohlc.map((x,i) => [x.date, x.open, x.high, x.low, x.close]).reverse()
    //   })
    // }
    if (rsi) {
      yAxis.push({name: "RSI", height: "10%", top: "50%"});
      series.push({data: rsi.line.reverse(), yAxis: 0})
    }
    return {
      chart: { height: 500 },
      yAxis,
      series,
    };
  }

  render() {
    return (
      <div>
        <ReactHighstock config={this.getConfig()} />
      </div>
    );
  }
}

export default Chart2;