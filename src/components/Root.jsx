import React from 'react'
import { Router, Route, IndexRoute, browserHistory } from 'react-router'

import Main from './Samples/index.jsx'
import About from './About.jsx'
import Resume from './Resume/index.jsx'
import Code from './Code/index.jsx'

const Footer = () =>
  <footer />
  // <footer> &copy; Hiroyuki Ishii 2017. All Rights Reserved </footer>

const Root = () =>
  <Router history={browserHistory}>
    <Route path="/" component={Main} />
    <Route path="/about" component={About} />
    <Route path="/sample" component={Code} />
    <Route path="/resume" component={Resume} />
  </Router>

export default Root
