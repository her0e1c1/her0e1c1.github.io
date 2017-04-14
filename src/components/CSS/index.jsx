import React from 'react'
import { connect } from 'react-redux';


const FlexBox = (props) => (
  <div style={{display: "flex", border: "1px solid red", ...props}}>
    <div>{Object.keys(props).map(e => props[e])}</div>
    {[1,2,3,4,5].map(e => <div key={e} style={{border: "1px solid red"}}>{e}</div>)}
  </div>
)

const FontBox = (props) => (
  <div style={{border: "1px solid red"}}>
    <div>{Object.keys(props).map(e => `${e}=${props[e]}`).join(", ")}</div>
    <span style={{...props}}>text</span>
  </div>
)

class List extends React.Component {
  constructor(props) {
    super(props)
    this.state = {
      display: props.display || "block"
    }
  }
  render() {
    return (
      <ul>{[1,2,3].map((e, i) => <li key={i} style={this.state} >{e}</li>)}</ul>
    )
  }
}

// const displayList = ["block", "inline", "inline-block"]

const justifyContentList = ["flex-start", "flex-end", "center", "space-between", "space-around"]
const flexWrapList = ["wrap", "nowrap"]

const fontSizeList = ["12px", "2em", "80%", "small", "large"]
const fontWeightList = ["normal", "bold", "lighter"]
const fontStyleList = ["normal", "italic"]

const cross = (...lists) => {
  if (lists.length == 0) {
    return [[]]
  } else {
    let a = []
    const rv = cross(...lists.slice(1))
    lists[0].map(e => {
      rv.map(e2 => {
        a.push([e].concat(e2))
      })
    })
    return a
  }
}

class CSS extends React.Component {
  constructor(props) {
    super(props)
  }
  render() {
    return (
      <div style={{backgroundColor: "white"}}>
        {cross(fontSizeList, fontWeightList, fontStyleList).map(e =>
          <FontBox fontSize={e[0]} fontWeight={e[1]} fontStyle={e[2]} />
         )}
        {justifyContentList.map(e => <FlexBox justifyContent={e} />)}
        {flexWrapList.map(e => <FlexBox flexWrap={e} width="30px" />)}
        <List />
        <List display="inline-block" />
      </div>
    )
  }
}

const mapStateToProps = state => ({})
const mapDispatchToProps = dispatch => ({})
export default connect(mapStateToProps, mapDispatchToProps)(CSS)
