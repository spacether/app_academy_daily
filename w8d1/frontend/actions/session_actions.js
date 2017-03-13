export const RECEIVE_CURRENT_USER = "RECEIVE_CURRENT_USER";
export const RECEIVE_ERRORS = "RECEIVE_ERRORS";
import * as API from '../util/session_api';


// regular actions
export const receiveCurrentUser = (currentUser) => ({
  type: RECEIVE_CURRENT_USER,
  currentUser
});

export const receiveErrors = (errors) => ({
  type: RECEIVE_ERRORS,
  errors
});

// async actions
export const signup = user => dispatch => (
  API.signup(user)
  .then(realUser => dispatch(receiveCurrentUser(realUser)))
  .fail(data => dispatch(receiveErrors(data.responseJSON)))
);

export const login = user => dispatch => (
  API.login(user)
  .then(realUser => dispatch(receiveCurrentUser(realUser)))
  .fail(data => dispatch(receiveErrors(data.responseJSON)))
);

export const logout = () => dispatch => (
  API.logout()
  .then(realUser => dispatch(receiveCurrentUser(null)))
  .fail(data => dispatch(receiveErrors(data.responseJSON)))
);
