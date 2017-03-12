import React from 'react'
import { Alert, Button } from 'react-bootstrap'
import { connect } from 'react-redux';
import Highlight from 'react-highlight'

// var path = require("path")

const HOST = __HOST__

const fetchCode = (path) => new Promise((resolve, reject) => {
  fetch("http://" + HOST + "/" + path)
    .then(r => resolve(r.text()))
})

class Code extends React.Component {
  constructor(props) {
    super(props)
    this.state = {code: "", codes: []}
    __CODES__.forEach(c => fetchCode(c).then(code => this.setState({codes: [code,...this.state.codes]})))
  }
  render() {
    const {codes} = this.state
    return (
      <div>
      {codes.map(code => 
        <Highlight className='go'>
          {code}
        </Highlight>
      )}
      </div>
  )}
}

const mapStateToProps = state => ({})
const mapDispatchToProps = dispatch => ({})
export default connect(mapStateToProps, mapDispatchToProps)(Code)
