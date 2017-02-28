import React from 'react'
import { Link } from 'react-router'

class Header extends React.Component {
  constructor(props) {
    super(props)
  }
  render() {
    return (
    <header>
      <ul style={{ border: "1px solid blue" }}>
        <li><Link to="/">HOME</Link></li>
        <li><Link to="/about">ABOUT</Link></li>
        <li><Link to="/sample">SAMPLE</Link></li>
      </ul>
    </header>
  )}
}

export default Header
