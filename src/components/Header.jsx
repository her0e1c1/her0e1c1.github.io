import React from 'react'

class Header extends React.Component {
  constructor(props) {
    super(props)
  }
  render() {
    return (
    <header>
      <a href="/">HOME</a>
      <a href="/about">ABOUT</a>
    </header>
  )}
}

export default Header
