import React from 'react'

class Input extends React.Component {
  constructor(props) {
    super(props)
    this.state = {
      value: "",
      options: ["test", "event", (props.event || "")],
      channel: props.channel,
      event: props.event || event,
    }
    this.handleChange = this.handleChange.bind(this);
  }
  
  handleChange(e) {
    console.log(e.target.value)
    const value = e.target.value
    const {event} = this.state
    this.state.channel.push(event, {body: value}, 10000)
    this.setState({value: value})
  }

  render() {
    const {value, event, options} = this.state
    return (
      <div>
        <select value={event}>{options.map(i => <option value={i}>{i}</option>)}</select>
        <input type="text" onChange={this.handleChange}/>
      </div>
    )}
}

export default Input
