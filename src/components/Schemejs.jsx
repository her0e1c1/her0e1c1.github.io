import React from 'react'
import { Alert, Grid, Row, Col, Button, DropdownButton, MenuItem } from 'react-bootstrap'
import { connect } from 'react-redux';
import $script from 'scriptjs'

const codes = {
  hello: `\
(begin
(define msg "Hello World!")
(define hello (lambda () (alert msg)))
(hello))
`,
  add1: `\
(begin
(define add1 (lambda (x) (+ x 1)))
(alert (add1 10)))
`,
}

const Codes = ({parent}) =>
  <DropdownButton bsStyle="primary" title={"codes"} id={"code"} onSelect={key => parent.changeCode(key)}>
    {Object.keys(codes).map(k => <MenuItem eventKey={k} key={k}>{k} </MenuItem>)}
  </DropdownButton>

class Schemejs extends React.Component {
  constructor(props) {
    super(props)
    $script('//cdn.rawgit.com/her0e1c1/schemejs/master/main.js', () => {
      this.setState({showSchemejs: true})  // import `parse`
    })
    this.state = {showSchemejs: false, code: codes.hello}
    this.changeCode = this.changeCode.bind(this)
  }

  changeCode(key) {
    this.setState({code: codes[key]})
  }

  render() {
    const {code, showSchemejs} = this.state
    return (
      <Grid>
        {!showSchemejs && <Alert bsStyle="warning">CAN NOT LOAD Schemejs</Alert>}
        <Row className="show-grid">
          <Col xs={6} md={4}>
            <textarea rows="5" cols="40" value={code} onChange={e => this.setState({code: e.target.value}) }/>
          </Col>
          <Col xs={6} md={4}>
            <Codes parent={this}/>
            <Button onClick={() => parse(this.state.code) }>Run</Button>
          </Col>
        </Row>
     </Grid>
  )}
}

const mapStateToProps = state => ({})
const mapDispatchToProps = dispatch => ({})
export default connect(mapStateToProps, mapDispatchToProps)(Schemejs)
