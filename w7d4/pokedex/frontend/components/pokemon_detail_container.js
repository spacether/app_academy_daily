import { connect } from 'react-redux';
import PokemonDetail from './pokemon_detail';

import {fetchOnePokemon} from '../actions/pokemon_actions';

const mapStateToProps = state => ({
  poke: state.pokemonDetail
});

const mapDispatchToProps = dispatch => ({
  fetchOnePokemon: (id) => dispatch(fetchOnePokemon(id))
});

export default connect(mapStateToProps, mapDispatchToProps)(PokemonDetail);
