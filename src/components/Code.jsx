import React from 'react'
import ReactDOM from 'react-dom'
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
    this.next = this.next.bind(this)
    this.prev = this.prev.bind(this)
  }

  next() {
    if (!this.state.disableScroll && this.state.index < this.state.codes.length) {
      this.setState({index: this.state.index + 1})
      let code = ReactDOM.findDOMNode(this.refs.code).children[0]
      code.scrollLeft = 0
      ReactDOM.findDOMNode(this).scrollIntoView()
    }
  }

  prev() {
    if (!this.state.disableScroll && this.state.index > 0) {
      this.setState({index: this.state.index - 1});
      let code = ReactDOM.findDOMNode(this.refs.code).children[0]
      code.scrollLeft = 0
      ReactDOM.findDOMNode(this).scrollIntoView()
    }
  }

  render() {
    const {codes, disableScroll, index} = this.state
    let code = ""
    if (0 <= index && index < codes.length) {
      code = codes[index].code
    }
    return (
      <div>
        <div style={{position: "fixed", backgroundColor: "black", width: "100%", fontSize: "1.2em"}}>
          <button type="button" onClick={this.prev}>Prev</button>
          <button type="button" onClick={this.next}>Next</button>
          {disableScroll ? "ON" : "OFF"}
        </div>
        <div style={{paddingTop: "15px"}}>
          <Swipeable
            onSwipedRight={this.prev}
            onSwipedLeft={this.next}
            onClick={e => this.setState({disableScroll: !this.state.disableScroll})}
          >
           <Highlight className='go' ref="code">{code}</Highlight>
         </Swipeable>
       </div>
      </div>
  )}
}

const mapStateToProps = state => ({})
const mapDispatchToProps = dispatch => ({})
export default connect(mapStateToProps, mapDispatchToProps)(Code)
