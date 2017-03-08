export const allTodos = (state) => {
  let ids = Object.keys(state.todos);
  return ids.map( id => (state.todos[id]) );
};
