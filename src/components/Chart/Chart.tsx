import _ = require("lodash");
import React = require("react");
import ReactHighstock = require("react-highcharts/ReactHighstock.src");
import * as I from "./Interface";
import * as DummyData from "./DummyData";

const DEFAULT_CODE = "TSE/1301";

interface Props {
  chart: I.Chart;
}

interface State {
  chart: I.Chart;
}

class HighStock extends React.Component<Props, State> {
  constructor(props: Props) {
    super(props);
  }

  getConfig(): any {
    const chart = __MOCK__ ? DummyData.chart : this.props.chart;
    const { ohlc, rsi, stochastic, bollinger_band, rolling_mean, macd, volume } = chart;
    let top = 0;
    let series = [] as I.Series[];
    let yAxis = [] as I.yAxis[];
    const setLine = ({
      data,
      name,
      lineWidth,
      color,
    }: {
      data: I.Line;
      name: string;
      lineWidth?: number;
      color?: string;
    }) => {
      lineWidth = lineWidth || 0.5;
      color = color || "black";
      if (!(data instanceof Array)) return;
      series.push({
        data: data.map(x => [x[0] * 1000, x[1]] as I.Point),
        yAxis: yAxis.length - 1,
        type: "line",
        name,
        lineWidth,
        color,
      });
    };
    const setY = (text: string, height: number) => {
      yAxis.push({ title: { text }, height: `${height}%`, top: `${top}%` });
      top += height;
    };
    if (ohlc) {
      setY("OHLC", 50);
      series.push({
        name: "OHLC",
        yAxis: 0,
        type: "candlestick",
        data: ohlc.map((x, i) => [x.date * 1000, x.open!, x.high!, x.low!, x.close!] as I.OHLCPoint),
      });
    }
    if (rolling_mean) {
      setLine({ data: rolling_mean.line25, name: "RL25", color: "blue" });
      rolling_mean.line50 && setLine({ data: rolling_mean.line50, name: "RL50", color: "green" });
      rolling_mean.line100 && setLine({ data: rolling_mean.line100, name: "RL100", color: "red" });
      rolling_mean.line200 && setLine({ data: rolling_mean.line200, name: "RL200", color: "red" });
    }
    if (bollinger_band) {
      setLine({ data: bollinger_band.sigma1, name: "s1", lineWidth: 0.1 });
      setLine({ data: bollinger_band.sigma2, name: "s2", lineWidth: 0.1 });
      setLine({ data: bollinger_band.sigma3, name: "s3", lineWidth: 0.1 });
      setLine({ data: bollinger_band.sigma1m, name: "s-1", lineWidth: 0.1 });
      setLine({ data: bollinger_band.sigma2m, name: "s-2", lineWidth: 0.1 });
      setLine({ data: bollinger_band.sigma3m, name: "s-3", lineWidth: 0.1 });
    }
    if (volume) {
      setY("VOLUME", 10);
      series.push({ name: "VOLUME", yAxis: 1, type: "column", data: volume.line });
    }
    if (rsi) {
      setY("RSI", 10);
      setLine({ data: rsi.line, name: "RSI" });
    }
    if (macd) {
      setY("MACD", 10);
      setLine({ data: macd.line, name: "line", color: "blue" });
      setLine({ data: macd.signal, name: "signal", color: "red" });
    }
    if (stochastic) {
      setY("STOCHASTIC", 10);
      setLine({ data: stochastic.k, name: "k", color: "blue" });
      setLine({ data: stochastic.d, name: "d", color: "green" });
      setLine({ data: stochastic.sd, name: "sd", color: "red" });
    }
    return {
      chart: { height: 500 },
      rangeSelector: { selected: 1 },
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

export default HighStock;
