import logger from 'redux-logger';
import { createStore, applyMiddleware, combineReducers } from 'redux';
import { persistStore } from 'redux-persist';
import { routerMiddleware } from 'react-router-redux';
import createHistory from 'history/createBrowserHistory';

const initialState = {
  lang: 'en',
  messages: require('assets/lang/en.json'), // lazy loading other languages
};

const locale = (state = initialState, action) => {
  switch (action.type) {
    case 'CHANGE_LANGUAGE': {
      const lang = action.lang;
      return {
        lang,
        messages: require(`assets/lang/${lang}.json`),
      };
    }
    default:
      return state;
  }
};

export const reducers = combineReducers({
  locale,
});

export const history = createHistory();

export const store = createStore(
  reducers,
  applyMiddleware(logger, routerMiddleware(history))
);

export const persistor = persistStore(store);
