import React from 'react';
import ListContainer from './todo_list/todo_list_container';
import TodoForm from './todo_list/todo_form';

const App = () => {
  let props = {receiveTodo: ListContainer.receiveTodo};
  return (
  <div>we're in react now!
    <ListContainer />
  </div>);
};

export default App;
