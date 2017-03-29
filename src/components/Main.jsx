import React from 'react'
import { Alert, Button } from 'react-bootstrap'
import { connect } from 'react-redux';
import {Socket} from './../phoenix.js'

import Schemejs from './Schemejs.jsx'
import Topic from './Topic.jsx'
import Header from './Header.jsx'
import Sample from './Sample.jsx'

const WEBSOCKET_URL = __WEBSOCKET_URL__


// sample => schemajs / parser / topic(phonenix client)


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
    return (
    <div>
      <Header />
      <h1>{this.props.translation.hello}</h1>
      {showConnectionError && 
       <Alert bsStyle="danger" onDismiss={() => false}>PHOENIX CONNECTION ERROR!</Alert>
      }
      <Schemejs />
      <Sample />
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
