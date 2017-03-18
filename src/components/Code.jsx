import path from 'path'
import React from 'react'
import ReactDOM from 'react-dom'
import { Alert, Button } from 'react-bootstrap'
import { connect } from 'react-redux'
import katex from 'katex'
import Highlight from 'react-highlight'
import "highlight.js/styles/dark.css"
import Swipeable from 'react-swipeable'
import "./code.css"
import Header from './Header.jsx'

export class Tex extends React.Component{
  render(){
    let { texContent } = this.props;
    let katexString = katex.renderToString(texContent,{"throwOnError":false});
    console.log(katexString)
    return(
      <span dangerouslySetInnerHTML={{__html: katexString.replace("AA", "<br />")}}/>
    )
  }
}

const fetchCode = (path) => new Promise((resolve, reject) => {
  fetch(`http://${__HOST__}/${path}`)
    .then(r => resolve(r.text()))
})

const List = ({parent, names}) => (
  <ul style={{ fontSize: "1.5em"}}>
    {names.map((n, i) =>
      <li key={i} onClick={() => parent.setState({index: i, showList: false})}>{n}</li>
     )}
 </ul>)

/* const a = String.raw`
 * a_N = (a_1 a_2 ... a_N) = \hat{a}
 * a_N = (a_1 a_2 ... a_N) = \hat{a}
 * \bigskip
 * This is the first line of the next paragraph.
 * `*/

class Code extends React.Component {
  constructor(props) {
    super(props)
    this.state = {index: 0, codes: [], disableScroll: false, showList: false}
    this.next = this.next.bind(this)
    this.prev = this.prev.bind(this)
  }

  componentDidMount() {
    let codes = []
    __CODES__.forEach(name => {
      const code = window.localStorage.getItem(name)
      if (code != undefined) {
        codes = [...codes, {code, name}]
      } else {
        fetchCode(name).then(code => {
          window.localStorage.setItem(name, code)
          codes = [...codes, {code, name}]
          this.setState({codes})
        })
      }
    })
    this.setState({codes})
  }

  next() {
    if (!this.state.disableScroll && this.state.index < this.state.codes.length - 1) {
      this.setState({index: this.state.index + 1})
      let code = ReactDOM.findDOMNode(this.refs.code).children[0]
      code.scrollLeft = 0
      ReactDOM.findDOMNode(this).scrollIntoView()
    }
  }

  prev() {
    if (!this.state.disableScroll && this.state.index > 0) {
      this.setState({index: this.state.index - 1});
      let code = ReactDOM.findDOMNode(this.refs.code).children[0]
      code.scrollLeft = 0
      ReactDOM.findDOMNode(this).scrollIntoView()
    }
  }

  render() {
    const {codes, disableScroll, index, showList} = this.state
    let code = ""
    let name = ""
    if (0 <= index && index < codes.length) {
      code = codes[index].code
      name = codes[index].name
    }
    const ext = path.extname(name).substr(1)  // skip the first .
    return (
      <div>
        {showList &&<List parent={this} names={__CODES__}/>}
        <div style={{position: "fixed", backgroundColor: "black", width: "100%", fontSize: "1.2em"}}>
          <button type="button" onClick={this.prev}>Prev</button>
          <button type="button" onClick={this.next}>Next</button>
          {disableScroll ? "ON" : "OFF"}
          {' '}{index}/{codes.length-1}
          {' '}{name}
          {' '}<span onClick={() => this.setState({showList: true})}>CODES</span>
        </div>
        <div style={{paddingTop: "15px"}}>
          <Swipeable
            onSwipedRight={this.prev}
            onSwipedLeft={this.next}
            onClick={e => this.setState({disableScroll: !this.state.disableScroll})}
          >
          <Highlight className={ext} ref="code">{code}</Highlight>
         </Swipeable>
       </div>
      </div>
  )}
}

const mapStateToProps = state => ({})
const mapDispatchToProps = dispatch => ({})
export default connect(mapStateToProps, mapDispatchToProps)(Code)
