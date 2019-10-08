import React from "react";
import ReactDOM from "react-dom";
import * as serviceWorker from "./serviceWorker";

// @ts-ignore
import raw from "raw.macro";
import ReactMarkdown from "react-markdown";

const README = raw("../README.md");
const RESUME_URL =
  "https://raw.githubusercontent.com/her0e1c1/her0e1c1.github.io/master/README.md";

const App = () => {
  return (
    <div>
      <a className={`fa fa-download`} href={RESUME_URL}>
        DOWNLOAD
      </a>
      <ReactMarkdown source={README} />
    </div>
  );
};

ReactDOM.render(<App />, document.getElementById("root"));
serviceWorker.unregister();
