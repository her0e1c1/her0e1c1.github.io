import React = require("react");
import { Label, Button } from "react-bootstrap";
import Signal from "./Signal";
import { getFavorites, setFavorites, delFavorites } from "./Cookie";
import * as I from "./Interface";
import List from "./List";

interface Props {
  parent: List;
  code: I.Code;
}

const fix = (a?: number) => a && a.toFixed(2);

class SammaryRow extends React.Component<Props, undefined> {
  private parent: List;
  private code: I.Code;

  constructor(props: Props) {
    super(props);
    this.parent = props.parent;
    this.code = props.code;
  }

  render() {
    const { code } = this;
    const s = code.signal;
    const diff = s.change;
    const ratio = s.change_percent;
    let bs = "default";
    if (diff > 0) {
      bs = "info";
    } else if (diff < 0) {
      bs = "danger";
    }
    // HOTFIX
    const a = s && (2 * s.buying_price - s.buying_price_2);
    return (
      <tr>
        <td>
          <a href={`/?path=chart&code=${code.code}`}> {code.code} </a>{" "}
        </td>
        <td>
          <b>
            {code.signal.price && code.signal.price.close}
          </b>
        </td>
        <td>
          {diff && ratio && <Label bsStyle={bs}>{`${diff} (${ratio}%)`}</Label>}
          {diff && <Label bsStyle={bs}>{`${diff}`}</Label>}
        </td>
        <td>
          <Signal signal={code.signal} />
        </td>
        <td>
          <b>
            {`${fix(a)}`}
            {" "}
            {`${fix(s.buying_price)}(${fix(s.buying_price_percent)}%)`}
            {" "}
            {`${fix(s.buying_price_2)}(${fix(s.buying_price_2_percent)}%)`}
          </b>
        </td>
        <td>
          {this.parent.state.favorites.includes(code.code)
            ? <Button bsSize="xsmall" bsStyle={"danger"} onClick={() => this.parent.delFavorites(code.code)}>
                DEL
              </Button>
            : <Button bsSize="xsmall" onClick={() => this.parent.setFavorites(code.code)}>
                ADD
              </Button>}
        </td>
</tr>

    );
  }
}

export { SammaryRow };
