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
