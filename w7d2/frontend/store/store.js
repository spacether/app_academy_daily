import { createStore, applyMiddleware } from 'redux';
import RootReducer from '../reducers/root_reducer';
import Thunk from '../middleware/thunk';

// const thunk = Thunk();

let configureStore = (preloadedState = {}) => (
  createStore(
    RootReducer,
    preloadedState,
    applyMiddleware(Thunk)
  )
);

export default configureStore;
