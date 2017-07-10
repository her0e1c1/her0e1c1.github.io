import React = require("react");
import { Table, Button, Checkbox } from "react-bootstrap";
import Signal from "./Signal";
import * as C from "./Const";

interface Code {
  code: string;
  signal: Signal;
}

interface Props {
  code: Code;
}

class SammaryRow extends React.Component<Props, undefined> {
  private code: Code;
  private key: number;
  constructor(props) {
    super(props);
    this.code = props.code;
    this.key = props.key;
  }

  render() {
    const { code } = this;
    return (
      <tr key={this.key}>
        <td>
          <a href={`/?path=chart&code=${code.code}`}> {code.code} </a>{" "}
        </td>
        <td>
          {code.signal.price && code.signal.price.close}
        </td>
        <td>
          <Signal signal={code.signal} />
        </td>
      </tr>
    );
  }
}

const Sammary = ({ code }) =>
  <Table responsive>
    <thead>
      <tr>
        <th>CODE</th>
        <th>PRICE</th>
        <th>DIFF</th>
      </tr>
    </thead>
    <tbody>
      <SammaryRow code={code} />)
    </tbody>
  </Table>;

export { Sammary, SammaryRow };
