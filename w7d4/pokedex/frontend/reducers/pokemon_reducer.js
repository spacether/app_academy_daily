import { RECEIVE_ALL_POKEMON, ADD_ONE_POKEMON } from '../actions/pokemon_actions';
const pokemonReducer = (state = {}, action) => {
  switch (action.type) {
    case RECEIVE_ALL_POKEMON:
      return action.pokemon;
    case ADD_ONE_POKEMON:
      let newState = Object.assign({}, state);
      newState[action.poke.id] = action.poke;
      return newState;
    default:
      return state;
  }
};


export default pokemonReducer;
