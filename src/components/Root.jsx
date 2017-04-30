import React from 'react'
import { Router, Route, Redirect, IndexRoute, browserHistory } from 'react-router'
const parser = require('query-string');

import Header from './Header'
import Main from './Samples'
import Schemejs from './Samples/Schemejs'
import CsvParser from './Samples/CsvParser'
import PhoenixClient from './PhoenixClient'
import About from './About'
import Resume from './Resume'
import Code from './Code'
import CSS from './CSS'
import Chart from './Chart'

const Footer = () =>
  <footer />
  // <footer> &copy; Hiroyuki Ishii 2017. All Rights Reserved </footer>

class App extends React.Component {

  constructor(props) {
    super(props)
    // ?path=REDIRECT_PATH on github
    const qs = parser.parse(window.location.search)
    if (qs.path) {
      window.location.href = qs.path
    }
  }
  
  render() {
    return (
      <div>
        <Header/>
        {this.props.children}
        <Footer />
      </div>
    )}
}

// <Redirect from="/" to="/samples/schemejs" />
const Root = () =>
  <Router history={browserHistory}>
    <Redirect from="/" to="/chart" />
    <Route path="/" component={App}>
      <IndexRoute component={Main} />
      <Route path="samples" component={Main}>
        <IndexRoute component={Schemejs} />
        <Route path="schemejs" component={Schemejs} />
        <Route path="csv-parser" component={CsvParser} />
        <Route path="phoenix-client" component={PhoenixClient} />
      </Route>
      <Route path="about" component={About} />
      <Route path="resume" component={Resume} />
      <Route path="chart" component={Chart} />
    </Route>
    <Route path="/css" component={CSS} />
    <Route path="/sample" component={Code} />
  </Router>

export default Root
