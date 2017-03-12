import React from 'react'
import { Alert, Button } from 'react-bootstrap'
import { connect } from 'react-redux';
import Highlight from 'react-highlight'

const HOST = __HOST__

const fetchCode = (path) => new Promise((resolve, reject) => {
  fetch("http://" + HOST + "/sample/main.go")
    .then(r => resolve(r.text()))
})

class Code extends React.Component {
  constructor(props) {
    super(props)
    this.state = {code: ""}
    fetchCode("/sample/main.go").then(code => this.setState({code}))
  }
  render() {
    const {code} = this.state
    return (
      <Highlight className='go'>
        {code}
      </Highlight>
  )}
}

const mapStateToProps = state => ({})
const mapDispatchToProps = dispatch => ({})
export default connect(mapStateToProps, mapDispatchToProps)(Code)
