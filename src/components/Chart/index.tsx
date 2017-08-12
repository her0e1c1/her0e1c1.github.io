import React = require("react");
import { connect } from "react-redux";
import parser = require("query-string");
import List from "./List";
import HighStock from "./Chart";
import { setCurrentCode } from "./Action";
import * as I from "./Interface";

interface State {
  codes: string[];
}

const map = A => {
  if (Object.keys(A).length === 0) {
    return [];
  }
  const f = (acc, k) => {
    let a = [];
    acc.forEach(x => {
      let ss = A[k] instanceof Array ? A[k] : [A[k]];
      ss.forEach(s => a.push(Object.assign({}, x, { [k]: s })));
    });
    return a;
  };
  return Object.keys(A).reduce(f, [[]]);
};

const CodeSelectBox = ({ parent }: { parent: Chart }) =>
  <select value={parent.props.current_code} onChange={e => this.selectCode(e)}>
    {parent.props.codes.map((c, i) =>
      <option key={i}>
        {c.code}
      </option>
    )}
  </select>;

class Chart extends React.Component<I.ChartProps, State> {
  constructor(props: I.ChartProps) {
    super(props);
  }

  componentDidMount() {
    this.props.setCurrentCode();
  }

  render() {
    return (
      <div>
        <CodeSelectBox parent={this} />
        <List parent={this} />
      </div>
    );
  }
}

const mapStateToProps = state => ({
  state: state,
  current_code: state.chart.current_code,
  codes: state.chart.codes,
});
const mapDispatchToProps = dispatch => ({
  setCurrentCode: () => dispatch(setCurrentCode()),
});
export default connect(mapStateToProps, mapDispatchToProps)(Chart);
