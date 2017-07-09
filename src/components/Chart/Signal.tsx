import React = require("react");
import { ListGroup, ListGroupItem, Label, Table, Button } from 'react-bootstrap'
import * as C from "./Const";

class Signal extends React.Component<null, State> {
  constructor(props) {
    super(props);
    this.signal = props.signal;
  }

  render() {
    const signal = this.signal;
    const s = Object.keys(signal).filter(x => C.SIGNAL_KEYS.includes(x) && signal[x] != null)
    if (s.length === 0) {
      return <div/>;
    }
    return (
      <div>
         <ListGroup className="list-inline"> 
          {Object.keys(s).map((k, i) => (
          <ListGroupItem key={i}>
            <Label bsStyle="success">{`${k}(${s[k]})`}</Label>
          </ListGroupItem>
         )}
         </ListGroup>
      </div>
    );
  }
}

export default Signal;