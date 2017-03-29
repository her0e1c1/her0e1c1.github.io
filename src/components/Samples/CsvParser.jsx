import React from 'react'
import { Alert, Grid, Row, Col, Button, DropdownButton, MenuItem } from 'react-bootstrap'
import { runCsvParser } from './CsvParser.js'

const inputCSV = `\
a,b,c
aaaaa,bbbbb,ccccc
aa,bb
a,
aaaaa,bbbbb,ccccc
`

const convert = lines =>
  lines.map(l => l.join("_")).join("$\n")
  
class Sample extends React.Component {
  constructor(props) {
    super(props)
    this.state = {inputCSV}
  }
  
  render() {
    const {inputCSV} = this.state
    return (
      <Grid>
        <Row className="show-grid">
          <Col xs={6} md={4}>
            <textarea rows="5" cols="40" value={inputCSV} onChange={e => this.setState({inputCSV: e.target.value}) }/>
          </Col>
          <Col xs={6} md={4}>
            <Button onClick={() => alert(convert(runCsvParser(this.state.inputCSV))) }>Run</Button>
          </Col>
        </Row>
      </Grid>
    )}
}

export default Sample

