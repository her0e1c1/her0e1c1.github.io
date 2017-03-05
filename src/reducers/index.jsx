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
  console.log("languages=>")
  console.log(state)
  console.log(action)
  switch (action.type) {
    case "CHANGE_LANGUAGE": {
      return {...state, language: action.language, translation: translations[action.language]}
    }
    default:
      return state
  }
}

const Reducers = combineReducers({
  languages,
})

export default Reducers
