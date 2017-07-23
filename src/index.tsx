import React = require("react");
import ReactDOM = require("react-dom");
import { createStore, applyMiddleware } from "redux";
import { Provider } from "react-redux";
import thunkMiddleware from "redux-thunk";

import Root from "./components/Root";
import Reducers from "./reducers";
import "whatwg-fetch";

// where should this be defined?
declare global {
  export const __PYSTOCK_HOST__: string;
  export const __MOCK__: boolean;
}

let store = createStore(Reducers, applyMiddleware(thunkMiddleware));
const Main = () =>
  <Provider store={store}>
    <Root />
  </Provider>;
ReactDOM.render(<Main />, document.getElementById("main"));
