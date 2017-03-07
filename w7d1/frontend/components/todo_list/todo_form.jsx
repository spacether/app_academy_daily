import React from 'react';
import ReactDOM from 'react-dom';


class TodoForm extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      title: '',
      body: '',
      done: false
    };

    this.handleTitleChange = this.handleTitleChange.bind(this);
    this.handleBodyChange = this.handleBodyChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleTitleChange(e){
    e.preventDefault();
    this.setState({title: e.target.value});
  }

  handleBodyChange(e){
    e.preventDefault();
    this.setState({body: e.target.value});
  }

  handleSubmit(e){
    e.preventDefault();
    const todo = Object.assign({}, this.state, { id: new Date().getTime() });
    this.props.receiveTodo(todo);
    this.setState({
      title: "",
      body: ""
    });
  }

  render() {
    return (
      <form onSubmit={this.handleSubmit}>
        <label>Title
          <input type="text" value={this.state.title}
            onChange={this.handleTitleChange}></input>
        </label>
        <label>Body
          <textarea name="name" value={this.state.body}
            rows="4" cols="40" onChange={this.handleBodyChange}></textarea>
        </label>
        <input type="submit" value="Create Todo!"></input>
      </form>
    );
  }
}

export default TodoForm;
