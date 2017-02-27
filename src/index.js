import React from 'react'
import ReactDOM from 'react-dom'

import Header from './components/Header.jsx'
import Main from './components/Main.jsx'
import Router2 from './components/Router.jsx'
import Analytics from './components/Analytics.jsx'

const main = document.getElementById('main')
ReactDOM.render(<Router2 /> ,main)

const head = document.getElementsByTagName("head")[0]
ReactDOM.render(<Analytics/>, head)
