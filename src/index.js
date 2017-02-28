import React from 'react'
import ReactDOM from 'react-dom'

import Root from './components/Root.jsx'
import Analytics from './components/Analytics.jsx'

const main = document.getElementById('main')
ReactDOM.render(<Root /> ,main)

const head = document.getElementsByTagName("head")[0]
ReactDOM.render(<Analytics/>, head)
