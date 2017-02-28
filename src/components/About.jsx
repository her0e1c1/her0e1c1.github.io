import React from 'react'

import Input from './Input/index.jsx'
import Message from './Message.jsx'
import Topic from './Topic.jsx'
import Header from './Header.jsx'

class About extends React.Component {
  constructor(props) {
    super(props)
  }
  render() {
    return (
    <div>
      <Header />
      <h1>About this page</h1>
      <p>このページについて</p>
    </div>
  )}
}

export default About
