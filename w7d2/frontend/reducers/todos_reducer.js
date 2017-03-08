import {RECEIVE_TODOS, RECEIVE_TODO, REMOVE_TODO} from '../actions/todo_actions';
import merge from 'lodash/merge';

const todosReducer = (state = {}, action) => {
  const newState = {};
  switch(action.type) {
    case RECEIVE_TODOS:
      // let newState = merge({}, state, action.todos);
      Object.keys(state).map( id => (newState[id] = state[id]) );
      action.todos.map( item => (newState[item.id] = item) );
      return newState;
    case RECEIVE_TODO:
      // newState = merge({}, state, action.todo);
      Object.keys(state).map( id => (newState[id] = state[id]) );
      newState[action.todo.id] = action.todo;
      return newState;
    case REMOVE_TODO:
      let filtered = Object.keys(state).filter((id) =>
      (action.todo.id !== parseInt(id)));
      filtered.map( id => (newState[id] = state[id]) );
      return newState;
    default:
      return state;
  }
};

export default todosReducer;
