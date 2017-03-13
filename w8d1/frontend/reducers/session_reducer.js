import { RECEIVE_CURRENT_USER, RECEIVE_ERRORS }
  from '../actions/session_actions';

import { merge } from 'lodash';

const defaultState = {currentUser: null, errors: []};

export default (state = defaultState, action) => {
  let newState = merge({}, state);
  switch (action.type) {
    case RECEIVE_CURRENT_USER:
      newState.currentUser = action.currentUser;
      newState.errors = [];
      return newState;
    case RECEIVE_ERRORS:
      newState.errors = action.errors;
      return newState;
    default:
      return state;
  }
};
