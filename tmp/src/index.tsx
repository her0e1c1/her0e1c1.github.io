import 'reset-css';
import './style.css';

import React = require('react');
import ReactDOM = require('react-dom');
import { Provider } from 'react-redux';
import { PersistGate } from 'redux-persist/lib/integration/react';
import { connect } from 'react-redux';
import { IntlProvider, FormattedMessage, addLocaleData } from 'react-intl';
import Root from './component';
import { store, persistor } from './store';

// You can not import like this
// import { en } from 'react-intl/locale-data/en';
const en = require('react-intl/locale-data/en');
const ja = require('react-intl/locale-data/ja');
addLocaleData([...en, ...ja]);

const ReduxConnectedIntlProvider = connect((state: RootState) => ({
  locale: state.locale.lang,
  key: state.locale.lang,
  messages: state.locale.messages,
}))(IntlProvider);

class Main extends React.Component {
  render() {
    return (
      <Provider store={store}>
        <ReduxConnectedIntlProvider>
          <Root />
        </ReduxConnectedIntlProvider>
      </Provider>
    );
  }
}

ReactDOM.render(<Main />, document.getElementById('main'));
