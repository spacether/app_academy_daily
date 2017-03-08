import { connect } from 'react-redux';
import TodoDetailView from './todo_detail_view';

import { deleteTodo } from '../../actions/todo_actions';

const mapDispatchToProps = (dispatch, {todo}) => ({
  deleteTodo: () => dispatch(deleteTodo(todo))
});

export default connect(
  null,
  mapDispatchToProps
)(TodoDetailView);
