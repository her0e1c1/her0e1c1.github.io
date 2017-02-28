import React from 'react'
import { Alert } from 'react-bootstrap';

import Input from './Input/index.jsx'
import Message from './Message.jsx'
import Topic from './Topic.jsx'
import Header from './Header.jsx'

import {Socket} from './../phoenix.js'
const t = require('assets/lang/ja.json')

const WEBSOCKET_URL = __WEBSOCKET_URL__

import $script from 'scriptjs'

$script('//cdn.rawgit.com/her0e1c1/schemejs/master/main.js', 'schemejs')

const code = `\
(begin
(define msg "You are wellcome!")
(define hello (lambda () (alert msg)))
(hello))
`

class Main extends React.Component {
  constructor(props) {
    super(props)

    const socket = new Socket(WEBSOCKET_URL + "1")
    console.log(socket)
    socket.connect()
    socket.onError(() => this.setState({showConnectionError: true}))
    socket.onClose(() => console.log("the connection dropped"))

    // import `parse`
    $script.ready('schemejs', () => {
      return 1
    })
    this.state = {socket, code, showConnectionError: false}
  }
  render() {
    const {socket, code, showConnectionError} = this.state
    return (
    <div>
      <Header />

      <Alert bsStyle="danger" onDismiss={() => {alertVisible: showConnectionError}}>
        CONNECTION ERROR!
      </Alert>
      {t.hello}<br />
      <textarea rows="5" cols="40" value={code} onChange={e => this.setState({code: e.target.value}) }/>
      <br/><button onClick={() => parse(code) }>Run</button>
    </div>
  )}
}

export default Main
