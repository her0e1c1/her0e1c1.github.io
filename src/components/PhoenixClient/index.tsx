import React = require('react')
import { Socket } from 'src/phoenix.js'

// <Command value="get2 TSE/7203" channel={channel} event="bot">Predict TSE/7203</Command>
/*
class Command extends React.Component {
  constructor(props) {
    super(props)
    this.state = {
      value: props.value,
      event: props.event,
      channel: props.channel,
    }
    this.handleClick = this.handleClick.bind(this);
  }
  
  handleClick(e) {
    this.state.channel.push(this.state.event, {body: this.state.value})
  }

  render() {
    const {value, event} = this.state
    const {children} = this.props
    return <button onClick={this.handleClick} >{children}</button>
  }
}

class Input extends React.Component {
  constructor(props) {
    super(props)
    this.state = {
      value: "",
      event: props.events.length > 0 ? props.events[0] : "",
      events: props.events || [],
      channel: props.channel,
    }
    this.handleClick = this.handleClick.bind(this);
  }
  
  handleClick(e) {
    console.log(this.state)
    this.state.channel.push(this.state.event, {body: this.state.value}, 10000)
  }

  render() {
    const {value, event, events, channel} = this.state
    return (
      <div>
        <select onChange={e => this.setState({event: e.target.value})} >
          {events.map(i => <option value={i} key={i}>{i}</option>)}
        </select>
        <input type="text" onChange={e => this.setState({value: e.target.value})} placeholder={"echo hi"}/>
        <button onClick={this.handleClick} >submit</button>
        <Command value="get2 TSE/7203" channel={channel} event="bot">Predict TSE/7203</Command>
      </div>
  )}
}

class Message extends React.Component {

  constructor(props) {
    super(props)
    const channel = props.channel
    this.state = {
      channel: props.channel,
      events: props.events || [],
      children: [],
    }
  }

  componentDidMount() {
    const {channel, events} = this.state
    events.map(e => {
      channel.on(e, (msg) => {
        console.log(msg)
        const li = <li key={this.state.children.length}>{msg.body} from {e}</li>
        this.setState({children: [li, ...this.state.children]})
      })
    })
  }

  render() {
    const {children, channel, events} = this.state
    return (
      <div>
        TOPIC: {channel.topic} {' '}
        EVENTS: {events.join(",")}
        <Input channel={channel} events={events} />
        <ol>{children}</ol>
      </div>
    )}
}

// TODO: JOINボタン
class Topic extends React.Component {
  constructor(props) {
    super(props)
    if (props.socket == undefined)
      throw "Undefined socket";
    this.state = {
      socket: props.socket,
      topic: props.topic,
      events: props.events || [],
      channel: null,
    }
    this.handleClick = this.handleClick.bind(this);
  }

  componentWillMount() {
      this.join(this.state)
  }

  join({topic}) {
    if (topic == null) return
    let channel = this.state.socket.channel(topic)
    this.setState({channel})
    channel.join()
      .receive("ok", (resp) => {
        console.log("catching up", resp);
      })
      .receive("error", ({reason}) => console.log("failed join", reason) )
      .receive("timeout", () => console.log("Networking issue. Still waiting...") )
  }
  
  handleClick(e) {
    if (this.state.channel != null) return;
    this.join(this.state)
  }

  render() {
    const {topic, events, channel} = this.state
    let showMessage = channel != null 
    return (
      <div style={{ border: "1px solid black" }}>
        {showMessage && <Message channel={channel} events={events}/>}
    </div>
    )}
}

class PhoenixClient extends React.Component {
  constructor(props) {
    super(props)
    const socket = new Socket(__WEBSOCKET_URL__)
    socket.connect()
    socket.onError(() => this.setState({showConnectionError: true}))
    socket.onClose(() => console.log("the connection dropped"))
    this.state = {socket, showConnectionError: false}
  }
  render() {
    const {socket, showConnectionError} = this.state
    return (
      <div>
        <b>UNDER DEV</b>
        {showConnectionError &&
         <Alert bsStyle="danger" onDismiss={() => false}>PHOENIX CONNECTION ERROR!</Alert>
        }
        <Topic socket={socket} topic={"chat:client"} events={["bot", "new", "from_slack"]} />
      </div>
  )}
}

export = {
  PhoenixClient,
  Topic,
}
*/
