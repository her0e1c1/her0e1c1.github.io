import React, { PropTypes } from 'react'
import { Link } from 'react-router'
import { connect } from 'react-redux';
import { bindActionCreators } from 'redux'
import { NavDropdown, MenuItem } from 'react-bootstrap'

import { changeLanguage } from '../actions.ts'

const LANGUAGES = [
  ["en", "ENGLISH"],
  ["ja", "日本語"],
]

const Languages = ({parent}) =>
  <NavDropdown title={parent.props.translation.language} id="language">
    {LANGUAGES.map(([k, v]) =>
      <MenuItem key={k}
       onClick={() => parent.props.changeLanguage(k)}>{v}
      </MenuItem>
    )}
  </NavDropdown>

class Header extends React.Component {
  constructor(props) {
    super(props)
  }
  render() {
    return (
    <header>
      <ul style={{ border: "1px solid blue" }} className="list-inline">
        <li><Link to="/">{this.props.translation.home}</Link></li>
        <li><Link to="/about">{this.props.translation.about}</Link></li>
        <li><Link to="/sample">{this.props.translation.code}</Link></li>
        <li><Link to="/css">CSS</Link></li>
        <Languages parent={this} />
      </ul>
    </header>
  )}
}

Header.propTypes = {}
const mapStateToProps = state => ({
  translation: state.languages.translation
})
const mapDispatchToProps = dispatch => ({
  changeLanguage: bindActionCreators(changeLanguage, dispatch)
})
export default connect(mapStateToProps, mapDispatchToProps)(Header)
