import React from 'react'
import { Alert, Button } from 'react-bootstrap'
import { connect } from 'react-redux';
import {Socket} from './../../phoenix.js'

import Header from '../Header.jsx'
import Schemejs from './Schemejs.jsx'
import PhoenixClient from './PhoenixClient.jsx'
import Sample from './CsvParser.jsx'

class Main extends React.Component {
  render() {
    return (
    <div>
      <Header />
      <h1>{this.props.translation.hello}</h1>
      <Schemejs />
      <Sample />
    </div>
  )}
}

Main.propTypes = {}
const mapStateToProps = state => ({
  translation: state.languages.translation
})
const mapDispatchToProps = dispatch => ({})
export default connect(mapStateToProps, mapDispatchToProps)(Main)
