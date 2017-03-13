import React from 'react'
import { Alert, Button } from 'react-bootstrap'
import { connect } from 'react-redux'
import Highlight from 'react-highlight'
import ReactSwipe from 'react-swipe'
import "highlight.js/styles/dark.css"
import "./code.css"

import Header from './Header.jsx'

const HOST = __HOST__

const fetchCode = (path) => new Promise((resolve, reject) => {
  fetch("http://" + HOST + "/" + path)
    .then(r => resolve(r.text()))
})

class Code extends React.Component {
  constructor(props) {
    super(props)
    this.state = {code: "", codes: [], disableScroll: false}
    __CODES__.forEach(c => fetchCode(c).then(code => this.setState({codes: [code,...this.state.codes]})))
  }

  render() {
    const {codes, disableScroll} = this.state
    return (
      <div>
        <Header />
        <button type="button" onClick={() => this.refs.code.prev()}>Prev</button>
        <button type="button" onClick={() => this.refs.code.next()}>Next</button>
        {disableScroll ? "ON" : "OFF"}
        <ReactSwipe key={codes.length} ref="code" className="mySwipe" swipeOptions={{disableScroll}}>
        {codes.map((code, idx) => 
          <div key={idx} onClick={() => this.setState({disableScroll: !this.state.disableScroll})}>
            <Highlight className='go'>{code}</Highlight>
          </div>
        )}
        </ReactSwipe>
      </div>
  )}
}

const mapStateToProps = state => ({})
const mapDispatchToProps = dispatch => ({})
export default connect(mapStateToProps, mapDispatchToProps)(Code)
