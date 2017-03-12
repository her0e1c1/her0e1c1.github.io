import React from 'react'
import ReactDOM from 'react-dom'
import { createStore } from 'redux'
import { Provider } from 'react-redux'

import Root from './components/Root.jsx'
import Reducers from './reducers/index.jsx'
import "highlight.js/styles/dark.css"

let store = createStore(Reducers)
const Main = () => <Provider store={store}><Root /></Provider>
ReactDOM.render(<Main /> ,document.getElementById('main'))

// const Head = () => <div/>
// const head = document.getElementsByTagName("head")[0]
// head.appendChild(<Head/>)
