import * as API from '../utils/api';

export const RECEIVE_ALL_POKEMON = "RECEIVE_ALL_POKEMON";


// real action
export const receiveAllPokemon = pokemon => ({
	type: RECEIVE_ALL_POKEMON,
	pokemon
});



// async actions
export const fetchAllPokemon = () => dispatch => (
  API.fetchAllPokemon()
    .then(jsonOut => dispatch(receiveAllPokemon(jsonOut)))

);
