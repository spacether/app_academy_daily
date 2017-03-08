import React from 'react';
import TodoContainer from './todo_detail_view_container';

class TodoListItem extends React.Component{
  constructor(props){
    super(props);
    console.log('making todo list item ');
    console.log(props);
    this.state = {done: this.props.todo.done, detail: false};
    this.handleRemove = this.handleRemove.bind(this);
    this.handleDone = this.handleDone.bind(this);
    this.toggleDetail = this.toggleDetail.bind(this);
  }

  handleDone(e){
    // debugger;
    e.preventDefault();
    const todo = Object.assign({}, this.props.todo,
      { done: !this.state.done });
    this.props.receiveTodo(todo);
    this.setState({done: !this.state.done});
  }

  handleRemove(e){
    e.preventDefault();
    this.setState({detail: false});
    this.props.removeTodo(this.props.todo);
  }

  toggleDetail(e){
    console.log('toggled on ',this.props.todo.id);
    e.preventDefault();
    this.setState({detail: !this.state.detail});
  }

  render(){
    let doneVal = (this.state.done) ? "Finished" : "In Process";

    let detail = "";
    if (this.state.detail) detail = (<TodoContainer todo={this.props.todo} />) ;
    // debugger;

    return (
      <li>
        <a onClick={this.toggleDetail}>
          {this.props.todo.title}
        </a>

        <button onClick={this.handleDone}>
          {doneVal}
        </button>

        {detail}
      </li>
    );
  }
}

export default TodoListItem;
