import path from 'path'
import React from 'react'
import ReactDOM from 'react-dom'
import { Alert, Button, Modal } from 'react-bootstrap'
import { NavDropdown, MenuItem } from 'react-bootstrap'
import { connect } from 'react-redux'
import Highlight from 'react-highlight'
import Swipeable from 'react-swipeable'
import "highlight.js/styles/dark.css"
import "./code.css"

import { runCsvParser } from '../Samples/CsvParser.js'
const Papa = require('papaparse')

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
      <li key={code.i} onClick={() => parent.setState({index: code.i, showList: false})}>{code.name} {code.i}</li>
     )}
  </ul>
  )}

const getExt = name => path.extname(name).substr(1)  // skip the first "."

const Lang = ({parent}) => {
  const l = new Set(parent.state.ALLCODES.map(code => getExt(code.path)))
  const {lang, categories} = parent.state
  return (
    <NavDropdown title={lang || "language"} id="language">
      <MenuItem key={"all"} active={!lang} onClick={() => parent.filter({lang: null, categories})} >all</MenuItem>
    {[...l].map(l =>
      <MenuItem key={l} active={l == lang}
       onClick={() => parent.filter({lang: l, categories})}>{l}
      </MenuItem>
    )}
  </NavDropdown>
  )}

const Categories = ({parent}) => {
  let l = parent.state.ALLCODES.map(c => c.path.split(/\/|\./)).reduce((acc, x) => acc.concat(...x), [])
  l = new Array(...new Set(l))
  l.sort()
  return (
    <ul style={{ border: "1px solid blue" }} className="list-inline">
    {l.map(c =>
      <li key={c}><Button key={c} bsStyle={parent.state.categories.has(c) ? "success" : "default"}
       onClick={() => parent.updateCategories(c)}>{c}
      </Button></li>
    )}
  </ul>
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
            <li><Button bsSize="xsmall" onClick={() => parent.fetch() }>UPDATE</Button></li>
            <Lang parent={this.props.parent} />
            <li><Button bsSize="xsmall" onClick={() => parent.clear() }>CLEAR</Button></li>
            <li><Button bsSize="xsmall" onClick={() => parent.setState({showCategories: true})}>CATEGORY</Button></li>
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
    const categories = JSON.parse(window.localStorage.getItem("categories")) || new Set()
    this.state = {
      codes: [],
      ALLCODES: [],
      disableScroll: false,
      showList: false,
      showCategories: false,
      categories: new Set(categories),
      lang,
      category,
      index
    }
    this.next = this.next.bind(this)
    this.prev = this.prev.bind(this)
    this.filter = this.filter.bind(this)
    this.fetch = this.fetch.bind(this)
    this.clear = this.clear.bind(this)
  }

  componentDidMount() {
    this.fetch(false)
  }

  fetch(set=true) {
    const setState = ({codes}) =>
      this.setState({codes: this._filter({...this.state, codes}), ALLCODES: codes})
    const handle = (csv) => {
      const codes = Papa.parse(csv).data
                        .filter(row => row.length >= 2)
                        .map((row, i) => ({name: row[0], code: row[1], path: row[2], i}))
      setState({codes})
    }

    const csv = window.localStorage.getItem("csv")
    if (csv) {
      handle(csv)
    } else {
      fetchCode("code.csv").then(csv => {
        handle(csv)
        window.localStorage.setItem("csv", csv)
      })
    }
  }

  clear() {
    this.setState({lang: null, category: null, index: 0, codes: this.state.ALLCODES, categories: new Set()})
  }

  updateCategories(category) {
    let c = new Set(this.state.categories)
    if (!category) {
      c.clear()
    } else if (c.has(category)) {
      c.delete(category)
    } else {
      c.add(category)
    }
    this.filter({...this.state, categories: c})
  }

  componentDidUpdate() {
    if (typeof MathJax !== "undefined")
      MathJax.Hub.Queue(["Typeset", MathJax.Hub]);
    window.localStorage.setItem("index", this.state.index)
    window.localStorage.setItem("lang", this.state.lang)
    window.localStorage.setItem("categories", JSON.stringify([...this.state.categories]))
  }

  _filter ({lang, category, categories, codes=[]}) {
    return codes.filter(code => {
      const ext = getExt(code.path)
      if (lang && !ext.endsWith(lang)) {
        return false
      }
      if (categories && categories.size > 0) {
        if ([...categories].every(c => code.path.indexOf(c) == -1)) {
          return false
        }
      }
      return true
    }).map((code, i) => ({...code, i}))
  }

  filter ({lang, category, categories=new Set(), codes=[]}) {
    let index = 0
    const c = this._filter({lang, category, categories, codes: this.state.ALLCODES})
    this.setState({codes: c, index, lang, category, categories})
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
            {!disableScroll && <p style={{paddingTop, fontWeight: "bold", fontSize: "1.2em"}}>{name}</p>}
            {ext == "tex" ? <div ref="code" dangerouslySetInnerHTML={{__html: code}} style={{paddingTop: "20px"}}/> :
            <Highlight className={ext} ref="code">{code}</Highlight>
            }
            </Swipeable>
            </div>
            </div>
            }
        <Modal show={this.state.showCategories} keyboard={true} backdrop={true} onHide={() => this.setState({showCategories: false})}>
          <Modal.Body><Categories parent={this} /></Modal.Body>
          <Modal.Footer><Button onClick={() => this.setState({showCategories: false})} >Close</Button></Modal.Footer>
        </Modal>
      </div>
  )}
}

const mapStateToProps = state => ({})
const mapDispatchToProps = dispatch => ({})
export default connect(mapStateToProps, mapDispatchToProps)(Code)
