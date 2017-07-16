import React = require("react");
import { Label, Button } from "react-bootstrap";
import Signal from "./Signal";
import { getFavorites, setFavorites, delFavorites } from "./Cookie";
import * as C from "./Const";
import * as I from "./Interface";

interface Props {
  code: I.Code;
}

class SammaryRow extends React.Component<Props, undefined> {
  private code: I.Code;
  constructor(props) {
    super(props);
    this.parent = props.parent;
    this.code = props.code;
  }

  render() {
    const { code } = this;
    const p = code.signal.price;
    const diff = p && p.close - p.open;
    const ratio = p && (diff / p.open * 100).toFixed(2);
    let bs = "";
    if (diff > 0) {
      bs = "info";
    } else if (diff < 0) {
      bs = "danger";
    }
    return (
      <tr>
        <td>
          <a href={`/?path=chart&code=${code.code}`}> {code.code} </a>{" "}
        </td>
        <td>
          <b>{code.signal.price && code.signal.price.close}</b>
        </td>
        <td>
          {p && <Label bsStyle={bs}>{`${diff} (${ratio}%)`}</Label>}
        </td>
        <td>
          <Signal signal={code.signal} />
        </td>
        <td>
          <b>{code.signal.score}</b>
        </td>
        <td>
          {this.parent.state.favorites.includes(code.code)
          ? <Button bsSize="xsmall" bsStyle={"danger"} onClick={() => this.parent.delFavorites(code.code)}>DEL</Button>
          : <Button bsSize="xsmall" onClick={() => this.parent.setFavorites(code.code)}>ADD</Button>
          }
        </td>
      </tr>
    );
  }
}

// DEPRECATED
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
