import React from 'react'
import Input from './Input/index.jsx'
import Message from './Message.jsx'


class Topic extends React.Component {
  constructor(props) {
    super(props)
    if (props.socket == undefined)
      throw "Undefined socket";
    this.state = {
      socket: props.socket,
      topic: props.topic,
      event: props.event,
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
    console.log(channel)
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
    const {topic, event, channel} = this.state
    let showMessage = channel != null 
    return (
      <div style="border: 1px solid black;">
        TOPIC: {showMessage ? topic : <input type="text" onChange={e => this.setState({topic: e.target.value})}/>}
        <br/>
        EVENT: {showMessage ? event :<input type="text" onChange={e => this.setState({event: e.target.value})}/>}
        {!showMessage && <button onClick={this.handleClick}>JOIN</button>}
        {showMessage && <Input channel={channel} event={event}/>}
        {showMessage && <Message channel={channel} event={event}/>}
    </div>
    )}
}


export default Topic
