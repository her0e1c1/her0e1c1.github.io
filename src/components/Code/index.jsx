import path from 'path'
import React from 'react'
import ReactDOM from 'react-dom'
import { Alert, Button } from 'react-bootstrap'
import { NavDropdown, MenuItem } from 'react-bootstrap'
import { connect } from 'react-redux'
import Highlight from 'react-highlight'
import Swipeable from 'react-swipeable'
import "highlight.js/styles/dark.css"
import "./code.css"

const toNullIfNeeded = s => s == "null" ? null : s

const fetchCode = (path) => new Promise((resolve, reject) => {
  fetch(`http://${__HOST__}/${path}`)
    .then(r => resolve(r.text()))
})

const List = ({parent}) => {
  const codes = parent.state.codes
  return (
  <ul style={{ fontSize: "1.5em"}}>
    {codes.map(code =>
      <li key={code.i} onClick={() => parent.setState({index: code.i, showList: false})}>{code.name}</li>
     )}
  </ul>
  )}

const getExt = name => path.extname(name).substr(1)  // skip the first "."

const Lang = ({parent}) => {
  const l = new Set(parent.state.ALLCODES.map(code => getExt(code.name)))
  const {lang, category} = parent.state
  return (
    <NavDropdown title={lang || "language"} id="language">
      <MenuItem key={"all"} active={!lang} onClick={() => parent.filter({lang: null, category})} >all</MenuItem>
    {[...l].map(l =>
      <MenuItem key={l} active={l == lang}
       onClick={() => parent.filter({lang: l, category})}>{l}
      </MenuItem>
    )}
  </NavDropdown>
  )}

const Category = ({parent}) => {
  const l = ["sort", "cases"]
  const {lang, category} = parent.state
  return (
    <NavDropdown title={category || "category"} id="category">
      <MenuItem key={"all"} active={!category} onClick={() => parent.filter({lang, category: null})} >all</MenuItem>
    {l.map(c =>
      <MenuItem key={c} active={c == parent.state.category}
       onClick={() => parent.filter({category: c, lang})}>{c}
      </MenuItem>
    )}
  </NavDropdown>
  )}

class Header extends React.Component {

  render() {
    const parent = this.props.parent
    const {index, codes} = parent.state
    // TODO: refactor
    let code = ""
    let name = ""
    if (0 <= index && index < codes.length) {
      code = codes[index].code
      name = codes[index].name
    }
    return (
        <div style={{position: "fixed", backgroundColor: "black", width: "100%", fontSize: "1.2em"}}>
          <ul style={{ border: "1px solid blue" }} className="list-inline">
            <li><Button bsSize="xsmall" onClick={parent.prev}>Prev</Button></li>
            <li><Button bsSize="xsmall" onClick={parent.next}>Next</Button></li>
            <li>{index}{codes.length > 0 ? `/${codes.length-1}` : ""}</li>
            <li><Button bsSize="xsmall" onClick={() => parent.setState({showList: true})}>CODES</Button></li>
            <li><Button bsSize="xsmall" onClick={() => fetchCode(name).then(code => {
            let codes = parent.state.codes
            window.localStorage.setItem(name, code)
            codes[index] = {code, name, i: index}
            parent.setState({codes})})
            } >UPDATE</Button></li>
            <Lang parent={this.props.parent} />
            <Category parent={this.props.parent} />
          </ul>
        </div>
    )}
}

class Code extends React.Component {
  constructor(props) {
    super(props)
    const index = parseInt(window.localStorage.getItem("index")) || 0
    const lang = toNullIfNeeded(window.localStorage.getItem("lang"))
    const category = toNullIfNeeded(window.localStorage.getItem("category"))
    this.state = {
      codes: [],
      ALLCODES: [],
      disableScroll: false,
      showList: false,
      lang,
      category,
      index
    }
    this.next = this.next.bind(this)
    this.prev = this.prev.bind(this)
    this.filter = this.filter.bind(this)
  }

  componentDidMount() {
    const setState = ({codes}) =>
      this.setState({codes: this._filter({...this.state, codes}), ALLCODES: codes})

    let codes = []
    __CODES__.forEach((name, i) => {
      const code = window.localStorage.getItem(name)
      if (code != undefined) {
        codes = [...codes, {code, name, i}]
      } else {
        fetchCode(name).then(code => {
          window.localStorage.setItem(name, code)
          codes = [...codes, {code, name, i}]
          setState({codes})
        })
      }
    })
    setState({codes})
  }

  componentDidUpdate() {
    if (typeof MathJax !== "undefined")
      MathJax.Hub.Queue(["Typeset", MathJax.Hub]);
    window.localStorage.setItem("index", this.state.index)
    window.localStorage.setItem("lang", this.state.lang)
    window.localStorage.setItem("category", this.state.category)
  }

  _filter ({lang, category, codes=[]}) {
    return codes.filter(code => {
      const ext = getExt(code.name)
      if (lang && !ext.endsWith(lang)) {
        return false
      }
      if (category && code.name.indexOf(category) == -1) {
        return false
      }
      return true
    }).map((code, i) => ({...code, i}))
  }

  filter ({lang, category}) {
    let index = 0
    const codes = this._filter({lang, category, codes: this.state.ALLCODES})
    this.setState({codes, index, lang, category})
  }

  next() {
    if (!this.state.disableScroll && this.state.index < this.state.codes.length - 1) {
      this.setState({index: this.state.index + 1})
      ReactDOM.findDOMNode(this).scrollIntoView()
      let code = ReactDOM.findDOMNode(this.refs.code)
      if (code && code.children.length > 0) {
        code.children[0].scrollLeft = 0
      }
    }
  }

  prev() {
    if (!this.state.disableScroll && this.state.index > 0) {
      this.setState({index: this.state.index - 1});
      ReactDOM.findDOMNode(this).scrollIntoView()
      let code = ReactDOM.findDOMNode(this.refs.code)
      if (code && code.children.length > 0) {
        code.children[0].scrollLeft = 0
      }
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
    const ext = getExt(name)
    const paddingTop = disableScroll ? 0 : "20px"
    return (
      <div>
      {showList ? <List parent={this} /> :
        <div>
        {!disableScroll && <Header parent={this}/>}
         <div style={{paddingTop}}>
           <Swipeable
             onSwipedRight={this.prev}
             onSwipedLeft={this.next}
             onClick={e => this.setState({disableScroll: !this.state.disableScroll})}
           >
             {ext == "tex" ? <div ref="code" dangerouslySetInnerHTML={{__html: code}} style={{paddingTop: "20px"}}/> :
              <Highlight className={ext} ref="code">{code}</Highlight>
             }
           </Swipeable>
         </div>
         </div>
      }
      </div>
  )}
}

const mapStateToProps = state => ({})
const mapDispatchToProps = dispatch => ({})
export default connect(mapStateToProps, mapDispatchToProps)(Code)