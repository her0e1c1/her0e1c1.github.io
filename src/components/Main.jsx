import React from 'react'
import { Alert, Button } from 'react-bootstrap'
import { connect } from 'react-redux';
import {Socket} from './../phoenix.js'
import marked from 'marked'

import Topic from './Topic.jsx'
import Header from './Header.jsx'

const t = require('assets/lang/ja.json')

const WEBSOCKET_URL = __WEBSOCKET_URL__

import $script from 'scriptjs'

const code = `\
(begin
(define msg "You are wellcome!")
(define hello (lambda () (alert msg)))
(hello))
`

console.log(marked('I am using __markdown__.'));

class Main extends React.Component {
  constructor(props) {
    super(props)

    const socket = new Socket(WEBSOCKET_URL)
    socket.connect()
    socket.onError(() => this.setState({showConnectionError: true}))
    socket.onClose(() => console.log("the connection dropped"))

    $script('//cdn.rawgit.com/her0e1c1/schemejs/master/main.js', () => {
      // import `parse`
      this.setState({showSchemajs: true})
    })
    this.state = {socket, code, showConnectionError: false, showSchemajs: false}
  }
  render() {
    const {socket, code, showConnectionError, showSchemajs} = this.state
    console.log(this.props)
    return (
    <div>
      <Header />

      <h1>{this.props.translation.hello }</h1>

      {showConnectionError && 
       <Alert bsStyle="danger" onDismiss={() => false}>
         CONNECTION ERROR!
       </Alert>
      }

      {showSchemajs &&
       <div>
         <textarea rows="5" cols="40" value={code} onChange={e => this.setState({code: e.target.value}) }/>
         <br/><Button bsSize="large" onClick={() => parse(code) }>Run</Button>
        </div>
      }

      <Topic socket={socket} topic={"chat:client"} events={["bot", "new", "from_slack", "event"]} />

    </div>
  )}
}

Main.propTypes = {}
const mapStateToProps = state => ({
  translation: state.languages.translation
})
const mapDispatchToProps = dispatch => ({})
export default connect(mapStateToProps, mapDispatchToProps)(Main)
