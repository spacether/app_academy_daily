import { connect } from 'react-redux';
import PokeForm from './poke_form';
import { withRouter } from 'react-router';

import {createPokemon} from '../actions/pokemon_actions';

const mapStateToProps = state => ({
  poke: {}
});

const mapDispatchToProps = dispatch => ({
  createPokemon: (poke) => dispatch(createPokemon(poke))
});


export default connect(mapStateToProps, mapDispatchToProps)(PokeForm);
