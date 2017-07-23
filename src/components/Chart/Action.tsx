import parser = require("query-string");
import * as I from "./Interface";

export const getList = () => {
  return (dispatch, getState) => {
    const state = getState().chart;
    const socket = state.socket;
    socket.addEventListener("open", m => {
      socket.send(JSON.stringify({ event: "list" }));
    });
    socket.addEventListener("message", m => {
      const data = JSON.parse(m.data);
      if (data.event === "list") {
        dispatch({ type: "CODE", codes: data.codes });
      }
    });
  };
};

export const setCurrentCode = (code?: string) => {
  code = code || parser.parse(window.location.search).code;
  console.log(code);
  return (dispatch, getState) => {
    const state = getState().chart;
    const socket = state.socket;
    socket.addEventListener("open", m => {
      socket.send(JSON.stringify({ event: "code", code }));
    });
    socket.addEventListener("message", m => {
      const data = JSON.parse(m.data);
      if (data.event === "code") {
        let s = data.ohlc;
        data.ohlc = s.open.map((x, i) => ({
          open: s.open[i][1],
          high: s.high[i][1],
          low: s.low[i][1],
          close: s.close[i][1],
          date: s.date[i][1],
        }));
        dispatch({ type: "SET_CURRENT_CODE", code, chart: data });
      }
    });
  };
};
