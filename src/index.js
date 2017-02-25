import React from 'react'
import ReactDOM from 'react-dom'

import Topic from './components/Topic.jsx'
import Analytics from './components/Analytics/index.jsx'
import Input from './components/Input/index.jsx'
import Message from './components/Message.jsx'
import {Socket} from './phoenix.js'

const t = require('assets/lang/ja.json')

const WEBSOCKET_URL = "ws://128.199.158.226:13309/socket"
const main = document.getElementById('main')

let socket = new Socket(WEBSOCKET_URL)
console.log(socket)
socket.connect()
socket.onError( () => console.log("there was an error with the connection!") )
socket.onClose( () => console.log("the connection dropped") )

ReactDOM.render(
    <div>
    {t.hello}
    <Topic socket={socket} />
    <Topic socket={socket} topic="chat:bot" event="bot" />
    <Topic socket={socket} topic="chat:client" event="from_slack" />
    </div>, main)

const head = document.createElement('div')
// const head = document.getElementsByTagName("head")
ReactDOM.render(<Analytics/>, head)
document.head.appendChild(head)

const headers = {
  'Content-Type': 'application/json',
}

const API_HOST = '128.199.158.226:13309'
const path = ''
const method = 'GET'

// window.fetch(`http://${API_HOST}/${path}`, {
//   headers,
//   method,
// }).then(res => {})

// e.target.checked
// dangerouslySetInnerHTM
