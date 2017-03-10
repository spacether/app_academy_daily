import * as API from '../utils/api';
import { hashHistory } from 'react-router';

export const RECEIVE_ALL_POKEMON = "RECEIVE_ALL_POKEMON";
export const RECEIVE_ONE_POKEMON = "RECEIVE_ONE_POKEMON";
export const ADD_ONE_POKEMON = "ADD_ONE_POKEMON";


// real action
export const receiveAllPokemon = pokemon => ({
	type: RECEIVE_ALL_POKEMON,
	pokemon
});

export const receiveOnePokemon = poke => ({
	type: RECEIVE_ONE_POKEMON,
	poke
});

export const addOnePokemon = poke => ({
	type: ADD_ONE_POKEMON,
	poke
});

// async actions
export const createPokemon = poke => dispatch => (
	API.createPokemon(poke)
		.then(pokemon => { dispatch(addOnePokemon(pokemon));
			 return poke;
		 })
 );


export const fetchAllPokemon = () => dispatch => (
  API.fetchAllPokemon()
    .then(jsonOut => dispatch(receiveAllPokemon(jsonOut)))

);

export const fetchOnePokemon = (id) => dispatch => (
  API.fetchOnePokemon(id)
    .then(jsonOut => dispatch(receiveOnePokemon(jsonOut)))

);
