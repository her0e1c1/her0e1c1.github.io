import React from 'react'
import { connect } from 'react-redux';


const FlexBox = (props) => (
  <div style={{display: "flex", border: "1px solid red", ...props}}>
    <div>{Object.keys(props).map(e => props[e])}</div>
    {[1,2,3,4,5].map(e => <div key={e} style={{border: "1px solid red"}}>{e}</div>)}
  </div>
)

// 各要素の幅の比を指定して余白を埋める
const FlexBox2 = ({children}) => (
  <div style={{display: "flex", border: "1px solid red", flexWrap: "nowrap"}}>
    {children.map((flex, i) => <div key={i} style={{border: "1px solid red", flex: `${flex} 0 0`, padding: "0 30"}}>{i}</div>)}
  </div>
)

// baiasのautoと0の違い
const FlexBox3 = ({children}) => (
  <div>
    <div style={{display: "flex", border: "1px solid red"}}>
      {children.map((e, i) => <div key={i} style={{border: "1px solid red", flex: "1 0 0"}}>{i}-{e}</div>)}
    </div>
    <div style={{display: "flex", border: "1px solid red"}}>
      {children.map((e, i) => <div key={i} style={{border: "1px solid red", flex: "1 0 auto"}}>{i}-{e}</div>)}
    </div>
  </div>
)

// 要素がはみ出ない場合は flex-shrinkは機能しないので、nowrap必要. widthを指定してもautoが優先
const FlexBox4 = ({children}) => (
    <div style={{display: "flex", border: "1px solid red", width: "100%", flexFlow: "row nowrap"}}>
      {[1,5,1,3,1].map((e, i) => <div key={i} style={{border: "1px solid red", flex: `0 ${e} auto`, width: "100px"}}>{i}-{e}</div>)}
    </div>
)
{/* <div style={{display: "flex", border: "1px solid red", flexFlow: "row nowrap"}}>
    {[1,2,3,4,5].map((flex, i) => <div key={i} style={{border: "1px solid red", flex: "1 0 auto"}}>{i}</div>)}
    </div> */}

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
        <FlexBox2 children={[0,0,0,0,0]} />
        <FlexBox2 children={[1,1,1,1,1]} />
        <FlexBox2 children={[1,2,1,2,1]} />

        <FlexBox3 children={["abc", "a", "aaaaaaaaaaaaa"]} />
        <FlexBox4 children={["abc", "a", "aaaaaaaaaaaaa"]} />

        {justifyContentList.map(e => <FlexBox justifyContent={e} />)}
        {flexWrapList.map(e => <FlexBox flexWrap={e} width="30px" />)}

        <List />
        <List display="inline-block" />
        {cross(fontSizeList, fontWeightList, fontStyleList).map(e =>
          <FontBox fontSize={e[0]} fontWeight={e[1]} fontStyle={e[2]} />
         )}
      </div>
    )
  }
}

const mapStateToProps = state => ({})
const mapDispatchToProps = dispatch => ({})
export default connect(mapStateToProps, mapDispatchToProps)(CSS)
