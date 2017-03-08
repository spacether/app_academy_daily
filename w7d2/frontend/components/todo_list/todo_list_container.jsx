import { connect } from 'react-redux';
import TodoList from './todo_list';

import { allTodos } from '../../reducers/selectors';
import { receiveTodo, fetchTodos, updateTodo,
  deleteTodo, createTodo } from '../../actions/todo_actions';


const mapStateToProps = state => ({
  todos: allTodos(state),
  errors: state.errors
});

const mapDispatchToProps = dispatch => ({
  receiveTodo: (todo) => dispatch(updateTodo(todo)),
  fetchTodos: () => dispatch(fetchTodos()),
  createTodo: (todo) => dispatch(createTodo(todo)),
});
// debugger;
export default connect(
  mapStateToProps,
  mapDispatchToProps
)(TodoList);
