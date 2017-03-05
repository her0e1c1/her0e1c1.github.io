import React, { PropTypes } from 'react'
import { Link } from 'react-router'
import { connect } from 'react-redux';
import { bindActionCreators } from 'redux'
import { NavDropdown, MenuItem } from 'react-bootstrap'

import { changeLanguage } from '../actions.jsx'

const LANGUAGES = [
  ["en", "ENGLISH"],
  ["ja", "日本語"],
]

class Header extends React.Component {
  constructor(props) {
    super(props)
  }
  render() {
    return (
    <header>
      <ul style={{ border: "1px solid blue" }} className="list-inline">
        <li><Link to="/">HOME</Link></li>
        <li><Link to="/about">ABOUT</Link></li>
        <li><Link to="/sample">SAMPLE</Link></li>
      </ul>
      <NavDropdown title={this.props.translation.language} id="language">
        {LANGUAGES.map(([k, v]) =>
          <MenuItem key={k}
            onClick={() => this.props.changeLanguage(k)}>{v}
          </MenuItem>
         )}
      </NavDropdown>
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
