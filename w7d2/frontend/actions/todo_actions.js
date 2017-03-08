export const RECEIVE_TODOS = "RECEIVE_TODOS";
export const RECEIVE_TODO = "RECEIVE_TODO";
export const REMOVE_TODO = "REMOVE_TODO";

import * as TodoAPI from '../util/todo_api_util';
import { receiveErrors, clearErrors } from './error_actions';

export const receiveTodos = (todos) => ({
  type: RECEIVE_TODOS,
  todos
});

export const receiveTodo = (todo) => ({
  type: RECEIVE_TODO,
  todo
});

export const removeTodo = (todo) => ({
  type: REMOVE_TODO,
  todo
});

export const fetchTodos = () => dispatch => (
  TodoAPI.fetchTodos().then(todos => dispatch(receiveTodos(todos)),
            err => dispatch(receiveErrors(err.responseJSON)))
);

export const fetchTodo = (todo_) => dispatch => (
  TodoAPI.fetchTodo(todo_).then(todo => dispatch(receiveTodo(todo)),
            err => dispatch(receiveErrors(err.responseJSON)))
);

export const updateTodo = (todo_) => dispatch => (
  TodoAPI.updateTodo(todo_).then(todo => dispatch(receiveTodo(todo)),
            err => dispatch(receiveErrors(err.responseJSON)))
);

export const deleteTodo = (todo_) => dispatch => (
  TodoAPI.deleteTodo(todo_).then(todo => dispatch(removeTodo(todo)),
            err => dispatch(receiveErrors(err.responseJSON)))
);

export const createTodo = (todo_) => dispatch => (
  TodoAPI.createTodo(todo_)
  .then(todo => dispatch(receiveTodo(todo)))
  .then(() => dispatch(clearErrors()))
  .fail(err => dispatch(receiveErrors(err.responseJSON)))
);
