import React = require("react");
import { ListGroup, ListGroupItem, Label, Table, Button } from "react-bootstrap";
import * as C from "./Const";

class Signal extends React.Component<null, State> {
  constructor(props) {
    super(props);
    this.signal = props.signal;
  }

  render() {
    const signal = this.signal;
    const keys = C.SIGNAL_KEYS.filter(k => signal[k] != null);
    if (keys.length === 0) {
      return <div />;
    }
    return (
      <div>
        <ListGroup className="list-inline">
          {keys.map((k, i) =>
            <ListGroupItem key={i}>
              <Label bsStyle="success">{`${k} (${signal[k]})`}</Label>
            </ListGroupItem>
          )}
        </ListGroup>
      </div>
    );
  }
}

export default Signal;
