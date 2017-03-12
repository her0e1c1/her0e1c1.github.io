import React from 'react'
import { Alert, Button } from 'react-bootstrap'
import { connect } from 'react-redux';
import {Socket} from './../phoenix.js'

import Schemejs from './Schemejs.jsx'
import Topic from './Topic.jsx'
import Header from './Header.jsx'
import Sample from './Sample.jsx'
import Code from './Code.jsx'

const WEBSOCKET_URL = __WEBSOCKET_URL__

class Main extends React.Component {
  constructor(props) {
    super(props)

    const socket = new Socket(WEBSOCKET_URL)
    socket.connect()
    socket.onError(() => this.setState({showConnectionError: true}))
    socket.onClose(() => console.log("the connection dropped"))
    this.state = {socket, showConnectionError: false}
  }
  render() {
    const {socket, showConnectionError} = this.state
    console.log(this.props)
    return (
    <div>
      <Header />
      <Code />
      <h1>{this.props.translation.hello }</h1>
      {showConnectionError && 
       <Alert bsStyle="danger" onDismiss={() => false}>
         PHOENIX CONNECTION ERROR!
       </Alert>
      }
      <Schemejs />
      <Sample />
      <Topic socket={socket} topic={"chat:client"} events={["bot", "new", "from_slack", "event"]} />
      {/* 個人投資家のためのサイト開発中です! => <a href="https://f1nance.herokuapp.com">pystock</a> */}
    </div>
  )}
}

Main.propTypes = {}
const mapStateToProps = state => ({
  translation: state.languages.translation
})
const mapDispatchToProps = dispatch => ({})
export default connect(mapStateToProps, mapDispatchToProps)(Main)
