import React from 'react'
var ReactHighstock = require('react-highcharts');

var data = [[1220832000000, 22.56], [1220918400000, 21.67], [1221004800000, 21.66], [1221091200000, 21.81], [1221177600000, 21.28], [1221436800000, 20.05], [1221523200000, 19.98], [1221609600000, 18.26], [1221696000000, 19.16], [1221782400000, 20.13], [1222041600000, 18.72], [1222128000000, 18.12], [1222214400000, 18.39], [1222300800000, 18.85], [1222387200000, 18.32], [1222646400000, 15.04], [1222732800000, 16.24], [1222819200000, 15.59], [1222905600000, 14.3], [1222992000000, 13.87], [1223251200000, 14.02], [1223337600000, 12.74], [1223424000000, 12.83], [1223510400000, 12.68], [1223596800000, 13.8], [1223856000000, 15.75], [1223942400000, 14.87], [1224028800000, 13.99], [1224115200000, 14.56], [1224201600000, 13.91], [1224460800000, 14.06], [1224547200000, 13.07], [1224633600000, 13.84], [1224720000000, 14.03], [1224806400000, 13.77], [1225065600000, 13.16], [1225152000000, 14.27], [1225238400000, 14.94], [1225324800000, 15.86], [1225411200000, 15.37], [1225670400000, 15.28], [1225756800000, 15.86], [1225843200000, 14.76], [1225929600000, 14.16], [1226016000000, 14.03], [1226275200000, 13.7], [1226361600000, 13.54], [1226448000000, 12.87], [1226534400000, 13.78], [1226620800000, 12.89], [1226880000000, 12.59], [1226966400000, 12.84], [1227052800000, 12.33], [1227139200000, 11.5], [1227225600000, 11.8], [1227484800000, 13.28], [1227571200000, 12.97], [1227657600000, 13.57], [1227830400000, 13.24], [1228089600000, 12.7], [1228176000000, 13.21], [1228262400000, 13.7], [1228348800000, 13.06], [1228435200000, 13.43], [1228694400000, 14.25], [1228780800000, 14.29], [1228867200000, 14.03], [1228953600000, 13.57], [1229040000000, 14.04], [1229299200000, 13.54]];

var config = {
  rangeSelector: {
    selected: 1
  },
  title: {
    text: 'AAPL Stock Price'
  },
  series: [{
    name: 'AAPL',
    data: data,
    tooltip: {
      valueDecimals: 2
    }
  }]
};

class Chart extends React.Component {

  constructor(props) {
    super(props)
    this.state = {}
  }

  render() {
    return (
      <div>
        <ReactHighstock config={config} />
      </div>
    )}
}

export default Chart

/*
  <div id="container" style="min-width: 740px; height: 420px; margin: 0 auto"></div>
  <script type="text/javascript">
    $(function(){
        $.getJSON('/api/quandl/{{ quandl_code.code }}', function (data) {
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
        });
    });
  </script>
  <div id="container" style="min-width: 740px; height: 420px; margin: 0 auto"></div>
  <script type="text/javascript">
    $(function(){
        $.getJSON('/api/quandl/{{ quandl_code.code }}', function (data) {
            $('#container').highcharts('StockChart', {
                chart: {height: 1000},
                rangeSelector: {selected: 1},
                series : data.series
            });
        });
    });
  </script>
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
