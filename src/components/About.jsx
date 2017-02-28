import React from 'react'

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
