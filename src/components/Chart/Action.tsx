import parser = require("query-string");
import * as I from "./Interface";

export const setList = (
  params: { page?: number; per_page?: number; wait?: boolean; desc?: boolean; order_by?: string; chart?: boolean; from?: string } = { wait: false }
) => {
  const { page, per_page, wait, desc, order_by, chart, from } = params;
  return (dispatch, getState) => {
    const chart = getState().chart;
    const socket = chart.socket;
    if (wait) {
      socket.addEventListener("open", m => {
        socket.send(JSON.stringify({ event: "list", page, per_page, desc, order_by, chart, from }));
      });
    } else {
      socket.send(JSON.stringify({ event: "list", page, per_page, desc, order_by, chart, from }));
    }
    socket.addEventListener("message", m => {
      const data = JSON.parse(m.data);
      if (data.event === "list") {
        dispatch({ type: "CODE", codes: new Array(...chart.codes.concat(data.codes)) });
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
        dispatch({ type: "SET_CURRENT_CODE", code, chart });
      }
    });
  };
};
