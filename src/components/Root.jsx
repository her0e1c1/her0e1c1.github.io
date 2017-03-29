import React from 'react'
import { Router, Route, IndexRoute, browserHistory } from 'react-router'

import Header from './Header.jsx'
import Main from './Samples/index.jsx'
import About from './About.jsx'
import Resume from './Resume/index.jsx'
import Code from './Code/index.jsx'

const Footer = () =>
  <footer />
  // <footer> &copy; Hiroyuki Ishii 2017. All Rights Reserved </footer>

class App extends React.Component {
  render() {
    return (
      <div>
        <Header/>
        {this.props.children}
        <Footer />
      </div>
    )}
}

const Root = () =>
  <Router history={browserHistory}>
    <Route path="/" component={App}>
      <IndexRoute component={Main} />
      <Route path="about" component={About} />
      <Route path="resume" component={Resume} />
    </Route>
    <Route path="/sample" component={Code} />
  </Router>

export default Root
