import React from 'react'
import { Link } from 'react-router'

class Header extends React.Component {
  constructor(props) {
    super(props)
  }
  render() {
    return (
    <header>
      <ul style={{ backgroundColor: "blue" }}>
        <li><Link to="/">HOME</Link></li>
        <li><Link to="/about">ABOUT</Link></li>
      </ul>
    </header>
  )}
}

export default Header
