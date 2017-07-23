import _ = require("lodash");
import React = require("react");
import ReactHighstock = require("react-highcharts/ReactHighstock.src");
import * as I from "./Interface";
import * as DummyData from "./DummyData";

const DEFAULT_CODE = "TSE/1301";

interface Series {
  type: "line" | "candlestick" | "column";
  data: I.Line | I.OHLC;
  yAxis: number;
  name: string;
  lineWidth?: number;
  color?: string;
}

interface yLine {
  value: number;
  label: { text: string };
  dashStyle: "shortdash";
  color: string;
  width: number;
}

interface yAxis {
  title?: { text: string };
  height: string;
  top: string;
  plotLines?: yLine[];
}

interface Config {
  series: Series[];
  yAxis: yAxis[];
  chart: { height: number };
  rangeSelector?: { selected: number };
}

interface Props {
  chart?: I.Chart;
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
    console.log(ohlc);
    let top = 0;
    let series = [] as Series[];
    let yAxis = [] as yAxis[];
    const setLine = (data: I.Line, name: string) => {
      series.push({ data, yAxis: yAxis.length - 1, type: "line", name });
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
        data: ohlc.map((x, i) => [x.date, x.open!, x.high!, x.low!, x.close!] as I.OHLCPoint),
      });
    }
    if (rolling_mean) {
      setLine(rolling_mean.line25, "RL25");
      setLine(rolling_mean.line50, "RL50");
      setLine(rolling_mean.line200, "RL200");
    }
    if (bollinger_band) {
      setLine(bollinger_band.sigma1, "s1");
      setLine(bollinger_band.sigma2, "s2");
      setLine(bollinger_band.sigma3, "s3");
      setLine(bollinger_band.sigma1m, "s-1");
      setLine(bollinger_band.sigma2m, "s-2");
      setLine(bollinger_band.sigma3m, "s-3");
    }
    if (volume) {
      setY("VOLUME", 10);
      series.push({ name: "VOLUME", yAxis: 1, type: "column", data: volume.line });
    }
    if (rsi) {
      setY("RSI", 10);
      setLine(rsi.line, "RSI");
    }
    if (macd) {
      setY("MACD", 10);
      setLine(macd.line, "line");
      setLine(macd.signal, "signal");
    }
    if (stochastic) {
      setY("STOCHASTIC", 10);
      setLine(stochastic.k, "k");
      setLine(stochastic.d, "d");
      setLine(stochastic.sd, "sd");
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
