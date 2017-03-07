import React from 'react';
import ReactDOM from 'react-dom';

import configureStore from './store/store';
import Root from './components/root.jsx';
import { allTodos } from './reducers/selectors'; // remove
import { receiveTodos, receiveTodo } from './actions/todo_actions'; //remove

document.addEventListener('DOMContentLoaded', () => {
  const store = configureStore();
  const root = document.getElementById('content');
  ReactDOM.render(<Root store={store}/>, root);

  window.store = store; // TODO: remove when done
  window.allTodos = allTodos; // TODO: remove when done
  window.receiveTodos = receiveTodos; // TODO: remove when done
  window.receiveTodo = receiveTodo; // TODO: remove when done
});

// on load


// let newTodos = [
//   { id: 1, title: 'first overwrite' },
//   { id: 2, title: 'second overwrite' },
//   { id: 4, title: 'new four' }
// ]
// store.getState(); // should return default state object
// store.dispatch(receiveTodo({ id: 3, title: "New3 Todo" }));
// store.getState(); // should include the newly added todo
// store.dispatch(receiveTodos(newTodos));
// store.getState(); // should return only the new todos
