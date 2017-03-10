import { createStore, applyMiddleware } from 'redux';
import RootReducer from '../reducers/root_reducer';
import thunk from 'redux-thunk';


const configureStore = (preloadedstate = {}) => {
  return createStore(
    RootReducer,
    preloadedstate,
    applyMiddleware(thunk)
  );
};

export default configureStore;
