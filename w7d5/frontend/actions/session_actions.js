export const RECEIVE_CURRENT_USER = "RECEIVE_CURRENT_USER";
export const RECEIVE_ERRORS = "RECEIVE_ERRORS";
import * as API from './util/api';


// regular actions
export const receiveCurrentUser = (currentUser) = {
  type: RECEIVE_CURRENT_USER,
  currentUser
}

export const receiveErrors = (errors) = {
  type: RECEIVE_ERRORS,
  errors
}

// export const login = user => dispatch => (
//   dispatch(API.login(user))
// );
//
// login(user) (thunk action creator)
// logout() (thunk action creator)
// signup(user) (thunk action creator)
