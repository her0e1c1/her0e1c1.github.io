import React from 'react'
import { Router, Route, IndexRoute, browserHistory } from 'react-router'

import Main from './Main.jsx'
import About from './About.jsx'
import Resume from './Resume.jsx'

const Footer = () =>
  <footer />
  // <footer> &copy; Hiroyuki Ishii 2017. All Rights Reserved </footer>

const Root = () =>
  <Router history={browserHistory}>
    <Route path="/" component={Main} />
    <Route path="/about" component={About} />
    <Route path="/sample" component={Main} />
    <Route path="/resume" component={Resume} />
  </Router>

export default Root
