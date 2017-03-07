import React from 'react';

class TodoDetailView extends React.Component{
  render(){
    return (
      <div>
        <br/>
        {this.props.body}
        <button onClick={this.props.handleRemove}>
          Delete ToDo
        </button>

      </div>
    );
  }
}

export default TodoDetailView;
