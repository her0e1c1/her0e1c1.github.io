import React = require("react");
import { Table, Button } from "react-bootstrap";

import { getFavorites, setFavorites, delFavorites } from "./Cookie";

interface Props {}

interface State {
  parent: Chart; // ???
  codes: string[];
  rows: any[];
}

class Favorite extends React.Component<Props, State> {
  constructor(props) {
    super(props);
    this.state = {
      parent: props.parent,
      codes: getFavorites(),
      rows: [],
    };
  }
  componentDidMount() {
    const socket = this.state.parent.state.socket;
    socket.addEventListener("open", () => {
      socket.send(JSON.stringify({ event: "favorites", codes: this.state.codes }));
    });
    socket.addEventListener("message", m => {
      const data = JSON.parse(m.data);
      if (data.event !== "favorites") {
        return;
      }
      const rows = this.state.codes.filter(c => data[c] !== undefined).map(c => {
        const d = data[c];
        const p = d.close;
        const price = d.close;
        const diff = d.close - d.open;
        return { ...d, price, diff, code: c };
      });
      this.setState({ rows });
    });
  }

  addFavorite() {}

  delFavorite() {}

  render() {
    return (
      <div>
        <Table responsive>
          <thead>
            <tr>
              <th>CODE</th>
              <th>PRICE</th>
              <th>DIFF</th>
            </tr>
          </thead>
          <tbody>
            {this.state.rows.map((r, i) =>
              <tr key={i}>
                <td>
                  <a href={`/?path=chart&code=${r.code}`}> {r.code} </a>{" "}
                </td>
                <td>
                  {r.price}
                </td>
                <td>
                  {r.diff}
                </td>
                <td onClick={() => delFavorites(r.code)}>
                  <Button bsStyle="primary">DEL</Button>
                </td>
              </tr>
            )}
          </tbody>
        </Table>
      </div>
    );
  }
}

export default Favorite;
