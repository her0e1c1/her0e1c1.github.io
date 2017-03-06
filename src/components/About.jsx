import React from 'react'
import { connect } from 'react-redux';
import { ListGroup, ListGroupItem } from 'react-bootstrap'
import { Link } from 'react-router'
import Header from './Header.jsx'

const links = [
  ["http://github.com/her0e1c1", "fa-github-square"],
  ["http://twitter.com/hiroyukiishi1", "fa-twitter-square"],
  ["https://jp.linkedin.com/in/ishii-hiroyuki-04052893","fa-linkedin-square"],
  ["http://www.facebook.com/hiroyuki.ishii.71", "fa-facebook-square"],
]

class About extends React.Component {
  constructor(props) {
    super(props)
  }
  render() {
    return (
      <div>
        <Header />
        <h1>{this.props.translation.about}</h1>
        <p>{this.props.translation.introduce}</p>
        <ListGroup className="list-inline">
          {links.map(([href, icon]) =>
            <ListGroupItem>
              <a href={href}><i className={`fa ${icon}`} style={{fontSize: "50px"}}></i></a>
            </ListGroupItem>
           )}
          <ListGroupItem><Link to="/resume">{this.props.translation.resume}</Link></ListGroupItem>
        </ListGroup>
      </div>
    )
  }
}

const mapStateToProps = state => ({
  translation: state.languages.translation
})
const mapDispatchToProps = dispatch => ({})
export default connect(mapStateToProps, mapDispatchToProps)(About)
