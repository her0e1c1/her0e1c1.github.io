import React from 'react'
import { ListGroup, ListGroupItem } from 'react-bootstrap'
import { connect } from 'react-redux';
import { Link } from 'react-router'

class Main extends React.Component {
  render() {
    return (
    <div>
      <h1>{this.props.translation.hello}</h1>
      <ListGroup className="list-inline">
        <ListGroupItem><Link to="/samples">Schemejs</Link></ListGroupItem>
        {/* <ListGroupItem><Link to="/samples/csv-parser">CsvParser</Link></ListGroupItem>
            <ListGroupItem><Link to="/samples/phoenix-client">PhoenixClient</Link></ListGroupItem> */}
      </ListGroup>
      {this.props.children}
    </div>
  )}
}

Main.propTypes = {}
const mapStateToProps = state => ({
  translation: state.languages.translation
})
const mapDispatchToProps = dispatch => ({})
export default connect(mapStateToProps, mapDispatchToProps)(Main)
