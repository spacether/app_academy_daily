import React from 'react';

import TodoListItem from './todo_list_item';
import TodoForm from './todo_form';

class TodoList extends React.Component{

  constructor(props){
    super(props);
  }

  componentDidMount(){
    this.props.fetchTodos();
  }

  render(){
    let props = this.props;

    return(
      <div>
        <ul>
          {props.todos.map( (todo, idx) => (
            <TodoListItem todo={todo} key={idx}
              removeTodo={props.removeTodo}
              receiveTodo={props.receiveTodo}
              fetchTodos={props.fetchTodos}
              />
          ))}
        </ul>
        <TodoForm createTodo={props.createTodo} errors={props.errors}/>
      </div>
    );
  }
}

export default TodoList;
