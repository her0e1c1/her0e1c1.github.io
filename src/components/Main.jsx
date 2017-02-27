import React from 'react'

import Input from './Input/index.jsx'
import Message from './Message.jsx'
import Topic from './Topic.jsx'
import Header from './Header.jsx'

import {Socket} from './../phoenix.js'
const t = require('assets/lang/ja.json')

const WEBSOCKET_URL = "ws://128.199.158.226:13309/socket"

class Main extends React.Component {
  constructor(props) {
    super(props)
    const socket = new Socket(WEBSOCKET_URL)
    console.log(socket)
    socket.connect()
    socket.onError( () => console.log("there was an error with the connection!") )
    socket.onClose( () => console.log("the connection dropped") )
    this.state = {socket}
  }
  render() {
    const {socket} = this.state
    return (
    <div>
      <Header />
      {t.hello}
    </div>
  )}
}

export default Main
