import React from 'react'
import { Router, Route, IndexRoute, browserHistory } from 'react-router'

import Main from './Main.jsx'
import About from './About.jsx'
import Header from './Header.jsx'

const Footer = () =>
  <footer />
  // <footer> &copy; Hiroyuki Ishii 2017. All Rights Reserved </footer>

const Root = () =>
  <Router history={browserHistory}>
    <Route path="/" component={Main}>
      <IndexRoute component={Main} />
      <Route path="about" component={About} />
    </Route>
  </Router>

export default Root