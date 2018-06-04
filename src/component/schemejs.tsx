import * as React from 'react';
import { connect } from 'react-redux';
import * as scriptjs from 'scriptjs';

const codes = {
  hello: `\
(begin
(define msg "Hello World!")
(define hello (lambda () (alert msg)))
(hello))
`,
  add1: `\
(begin
(define add1 (lambda (x) (+ x 1)))
(alert (add1 10)))
`,
};

class _Schemejs extends React.Component {
  constructor(props) {
    super(props);
    scriptjs('//cdn.rawgit.com/her0e1c1/schemejs/master/main.js', () => {
      this.setState({ showSchemejs: true }); // import `parse`
    });
    this.state = { showSchemejs: false, code: codes.hello };
  }

  render() {
    const { code, showSchemejs } = this.state;
    return (
      <div>
        <h1>Schemejs</h1>
        <textarea
          rows={5}
          cols={40}
          value={code}
          onChange={e => this.setState({ code: e.target.value })}
        />
        <div>
          <button onClick={() => parse(this.state.code)}>run</button>
        </div>
      </div>
    );
  }
}

export const Schemejs = connect(() => ({}))(_Schemejs);
