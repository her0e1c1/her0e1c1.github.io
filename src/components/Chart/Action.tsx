import parser = require("query-string");
import * as I from "./Interface";

export const setList = () => {
  const q = parser.parse(window.location.search);
  const page = q.page || 0;
  const per_page = q.per_page || 20;
  return (dispatch, getState) => {
    const chart = getState().chart;
    const socket = chart.socket;
    socket.addEventListener("open", m => {
      socket.send(JSON.stringify({ event: "list", page, per_page }));
    });
    socket.addEventListener("message", m => {
      const data = JSON.parse(m.data);
      if (data.event === "list") {
        dispatch({ type: "CODE", codes: data.codes });
      }
    });
  };
};

export const sortListByRatio = () => {
  return (dispatch, getState) => {
    const chart = getState().chart;
    // TODO: fix
    const codes = chart.codes.sort((a, b) => {
      const p1 = a.signal.price;
      const p2 = b.signal.price;
      if (p1 == null) return true;
      if (p2 == null) return false;
      const d1 = p1.close - p1.open;
      const d2 = p2.close - p2.open;
      return d1 < d2;
    });
    dispatch({ type: "CODE", codes: new Array(...codes) });
  };
};

export const setCurrentCode = (code?: string, line?: string) => {
  code = code || parser.parse(window.location.search).code;
  line = parser.parse(window.location.search).line;
  return (dispatch, getState) => {
    const state = getState().chart;
    const socket = state.socket;
    socket.addEventListener("open", m => {
      socket.send(JSON.stringify({ event: "code", code, line }));
    });
    socket.addEventListener("message", m => {
      const data = JSON.parse(m.data);
      if (data.event === "code") {
        const chart: I.Chart = {
          code: data.quandle_code,
          ohlc: data.ohlc,
          volume: {
            line: data.ohlc.map(x => [x.date * 1000, x.volume]),
          },
          rolling_mean: {
            line25: data["rolling_mean_25"],
            line50: data["rolling_mean_50"],
            line100: data["rolling_mean_100"],
          },
          bollinger_band: {
            sigma1: data["bollinger_band_25_1"],
            sigma2: data["bollinger_band_25_2"],
            sigma3: data["bollinger_band_25_3"],
            sigma1m: data["bollinger_band_25_-1"],
            sigma2m: data["bollinger_band_25_-2"],
            sigma3m: data["bollinger_band_25_-3"],
          },
          rsi: {
            line: data["rsi"],
          },
          macd: {
            line: data["macd_line"],
            signal: data["macd_signal"],
          },
          stochastic: {
            k: data["stochastic_k"],
            d: data["stochastic_d"],
            sd: data["stochastic_sd"],
          },
        };
        console.log(chart)
        dispatch({ type: "SET_CURRENT_CODE", code, chart });
      }
    });
  };
};
