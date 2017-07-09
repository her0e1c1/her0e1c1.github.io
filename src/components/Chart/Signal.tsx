import React = require("react");

const NON_SIGNAL_KEYS = ["created_at", "quandl_code", "updated_at"]

class Signal extends React.Component<null, State> {
  constructor(props) {
    super(props);
    this.signal = props.signal;
  }

  render() {
    const signal = this.signal;
    const s = Object.keys(signal).filter(x => !NON_SIGNAL_KEYS.includes(x) && signal[x] != null)
    if (s.length === 0) {
      return <div/>;
    }
    return (
      <div>
        SIGNALS: {Object.keys(s).map((k, i) => <span key={i}>{k} {s[k]}</span>)}
      </div>
    );
  }
}

export default Signal;