import React from 'react'

class Message extends React.Component {
  constructor(props) {
    super(props)
    let channel = props.channel
    let event = props.event || "from_slack"
    this.state = {
      channel: props.channel,
      topic: props.channel.topic,
      event: event,
      children: [],
    }
    this.handleChange = this.handleChange.bind(this);
    channel.on(event, (msg) => {
      this.setState({children: [<ul>{msg.body}</ul>, ...this.state.children]})
    })
  }
  
  handleChange(e) {
    console.log(e.target.value)
    const value = e.target.value
    const {event} = this.state
    this.state.channel.push(event, {body: value}, 10000)
    this.setState({value: value})
  }

  render() {
    const {children, topic, event} = this.state
    return (
      <div>
        <p>{topic}, {event}</p>
        <li>
          {children}
        </li>
      </div>
    )}
}

export default Message
