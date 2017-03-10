import { values } from 'lodash';

export const selectAllPokemon = (state) => ( values(state.pokemon));
