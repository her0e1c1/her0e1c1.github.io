import React = require("react");
import { Label } from "react-bootstrap";
import * as I from "./Interface";

interface Props {
  signal: I.Signal;
}

class Signal extends React.Component<Props, undefined> {
  private signal: I.Signal;

  constructor(props) {
    super(props);
    this.signal = props.signal;
  }

  render() {
    const signal = this.signal;
    const keys = I.SignalKeys.filter(k => signal[k] != null);
    if (keys.length === 0) {
      return <div />;
    }
    return (
      <div className="list-inline">
          {keys.map((k, i) => {
            const s = signal[k];
            let bs = "";
            if (s == "BUY") {
              bs = "success";
            } else {
              bs = "warning";
            }
            return <Label key={i} bsStyle={bs}>{`${k}`}</Label>;
          })}
      </div>
    );
  }
}

export default Signal;
