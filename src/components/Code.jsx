import React from 'react'
import { Alert, Button } from 'react-bootstrap'
import { connect } from 'react-redux'
import Highlight from 'react-highlight'
import ReactSwipe from 'react-swipe'
import "highlight.js/styles/dark.css"
import "./code.css"

import Header from './Header.jsx'
var Swipeable = require('react-swipeable')

const HOST = __HOST__

const fetchCode = (path) => new Promise((resolve, reject) => {
  fetch("http://" + HOST + "/" + path)
    .then(r => resolve(r.text()))
})

class Code extends React.Component {
  constructor(props) {
    super(props)
    this.state = {index: 0, codes: [], disableScroll: false}
    __CODES__.forEach(c => fetchCode(c).then(code => this.setState({codes: [...this.state.codes, {code, name: c}]})))
  }

  render() {
    const {codes, disableScroll, index} = this.state
    let code = ""
    if (0 <= index && index < codes.length) {
      code = codes[index].code
    }
    return (
      <div>
        <Header />
        <button type="button" onClick={() => this.setState({index: this.state.index - 1})}>Prev</button>
        <button type="button" onClick={() =>this.setState({index: this.state.index + 1}) }>Next</button>
        {disableScroll ? "ON" : "OFF"}
        <Swipeable
          onSwipedRight={e => this.setState({index: this.state.index - 1})}
          onSwipedLeft={e => this.setState({index: this.state.index + 1})}
          onClick={e => this.setState({disableScroll: !this.state.disableScroll})}
        >
            <Highlight className='go'>{code}</Highlight>
        </Swipeable>
      </div>
  )}
}

const mapStateToProps = state => ({})
const mapDispatchToProps = dispatch => ({})
export default connect(mapStateToProps, mapDispatchToProps)(Code)
