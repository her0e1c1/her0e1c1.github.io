import React = require("react");
import { MenuItem, DropdownButton, ButtonToolbar } from 'react-bootstrap'

import {
    getFavorites,
    setFavorites,
    delFavorites,
} from "./Cookie";


class Favorite extends React.Component<null, State> {
  constructor(props) {
    super(props);
    this.parent = props.parent;
    this.state = {
      codes: getFavorites(),
      rows: [],
    };
  }
  componentDidMount() {
    const socket = this.parent.state.socket; 
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

  render() {
    return (
      <div>
            <DropdownButton title={"Favorites"} id="favorite">
                {this.state.codes.map((c, i) => <MenuItem key={i}>{c}</MenuItem>)}
            </DropdownButton>
        <ul>
          {this.state.rows.map((r, i) =>
            <li key={i}>
              <a href={`/?path=chart&code=${r.code}`}>
                {r.code} {r.price} {r.diff}
              </a>
              <div onClick={() => this.addFavorite()}>FAVORITE</div>
              <span onClick={() => delFavorites(r.code)}>DEL</span>
            </li>
          )}
        </ul>
      </div>
    );
  }
}

export default Favorite;