import React = require('react')
import ReactDOM = require('react-dom')
import { createStore } from 'redux'
import { Provider } from 'react-redux'

import Root from './components/Root'
import Reducers from './reducers'
import 'whatwg-fetch'

// where should this be defined?
declare global {
  export const __PYSTOCK_HOST__: string;
}

let store = createStore(Reducers)
const Main = () => <Provider store={store}><Root /></Provider>
ReactDOM.render(<Main /> ,document.getElementById('main'))
