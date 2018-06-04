import * as React from 'react';
import { connect } from 'react-redux';
import { ConnectedRouter as Router } from 'react-router-redux';
import { FormattedMessage } from 'react-intl';
import { history } from 'src/store';
import { Route, Link } from 'react-router-dom';
import * as Action from 'src/action';
import { Schemejs } from './schemejs';

const links = [
  ['https://github.com/her0e1c1', 'fa-github-square'],
  ['https://twitter.com/hiroyukiishi1', 'fa-twitter-square'],
  ['https://jp.linkedin.com/in/ishii-hiroyuki-04052893', 'fa-linkedin-square'],
  ['https://www.facebook.com/hiroyuki.ishii.71', 'fa-facebook-square'],
];

const LANGUAGES = {
  // If lang is en, need to show jp link
  en: { label: '日本語', lang: 'ja' },
  ja: { label: 'ENGLISH', lang: 'en' },
};
const Header = connect(state => ({ state }))(props => {
  const lang = LANGUAGES[props.state.locale.lang];
  return (
    <header
      style={{
        border: '0px solid #000',
        padding: '20px',
        display: 'flex',
        justifyContent: 'space-between',
      }}
    >
      <Link to="/">
        <i
          className={`fa fa-home`}
          style={{ fontSize: '20px', color: '#777' }}
        />
      </Link>
      <div
        style={{
          textDecoration: 'underline',
        }}
        onClick={() => props.dispatch(Action.changeLanguage(lang.lang))}
      >
        {lang.label}
      </div>
    </header>
  );
});

const Hello = () => (
  <div>
    <h1>Hiroyuki Ishii</h1>
    <p>
      <FormattedMessage id="hello" />
    </p>
  </div>
);

const Portfolio = () => (
  <div>
    <h2>Portfolio</h2>
    <ul
      style={{
        display: 'flex',
        flexDirection: 'column',
        justifyContent: 'space-around',
        listStyleType: 'none',
      }}
    >
      <li>
        <Link to="/schemejs">scheme.js</Link>
      </li>
      <li>
        <Link to="/tango">tango</Link>
      </li>
      <li>
        <Link to="/pystock">pystock</Link>
      </li>
      <li>
        <Link to="/notebook">machine learning</Link>
      </li>
    </ul>
  </div>
);

const Links = () => (
  <div>
    <h2>Link</h2>
    <ul
      style={{
        display: 'flex',
        flexDirection: 'row',
        justifyContent: 'space-around',
        listStyleType: 'none',
      }}
    >
      {links.map(([href, icon], idx) => (
        <li key={idx} style={{ margin: '0px' }}>
          <a href={href} target="_blank">
            <i
              className={`fa ${icon}`}
              style={{ fontSize: '50px', color: '#777' }}
            />
          </a>
        </li>
      ))}
    </ul>
  </div>
);

const Home = () => (
  <div
    style={{
      display: 'flex',
      flexDirection: 'column',
      height: '50vh',
      justifyContent: 'space-between',
    }}
  >
    <Hello />
    <Portfolio />
    <Links />
  </div>
);

const Todo = () => <div>TODO</div>;

const Main = () => (
  <Router history={history}>
    <div>
      <Header />
      <div style={{ margin: '0 auto', width: '60%' }}>
        <Route exact path="/" component={Home} />
        <Route path="/schemejs" component={Schemejs} />
        <Route path="/tango" component={Todo} />
        <Route path="/pystock" component={Todo} />
        <Route path="/notebook" component={Todo} />
      </div>
    </div>
  </Router>
);

const Root = () => (
  <Router history={history}>
    <Main />
  </Router>
);

export default Root;
