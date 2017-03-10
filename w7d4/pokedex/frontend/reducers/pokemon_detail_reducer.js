import { RECEIVE_ONE_POKEMON } from '../actions/pokemon_actions';
const pokemonDetailReducer = (state = {}, action) => {
  switch (action.type) {
    case RECEIVE_ONE_POKEMON:
      return action.poke;
    default:
      return state;
  }
};


export default pokemonDetailReducer;
