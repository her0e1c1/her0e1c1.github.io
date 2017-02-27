import React from 'react'
import ReactDOM from 'react-dom'
import Main from './components/Main.jsx'
import Analytics from './components/Analytics.jsx'

const main = document.getElementById('main')
ReactDOM.render(<Main />, main)

const head = document.getElementsByTagName("head")[0]
ReactDOM.render(<Analytics/>, head)
