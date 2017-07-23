import { combineReducers } from 'redux'

// TODO: lazy load
const translations = {
  en: require('assets/lang/en.json'),
  ja: require('assets/lang/ja.json'),
}

const initialState = {
  language: 'en',
  translation: translations.en,
}

const languages = (state = initialState, action) => {
  switch (action.type) {
    case "CHANGE_LANGUAGE": {
      return {...state, language: action.language, translation: translations[action.language]}
    }
    default:
      return state
  }
}

// FIXME: fix socket init
const chart = (state = {chart: {}, current_code: "", codes: [], socket: new WebSocket(__PYSTOCK_HOST__)}, action) => {
  switch (action.type) {
    case "CODE": {
      return {...state, codes: action.codes}
    }
    case "SET_CURRENT_CODE": {
      return {...state, current_code: action.code, chart: action.chart}
    }
    default:
      return state
    }
}

const Reducers = combineReducers({
  languages,
  chart,
})

export default Reducers
