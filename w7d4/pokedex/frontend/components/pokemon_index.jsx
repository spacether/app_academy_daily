import React from 'react';

import PokemonIndexItem from './pokemon_index_item';

class PokemonIndex extends React.Component {

  componentDidMount () {
    this.props.fetchAllPokemon();
  }
  render () {
    if (this.props.pokemon) {
      let pokemon = this.props.pokemon.map( poke => (
        <PokemonIndexItem poke={poke} key={poke.id} />
      ));
      return(
        <section className="holder">
          <ul className="pokedex">
            {pokemon}
          </ul>
          {this.props.children}
        </section>
      );
    }
  }
}

export default PokemonIndex;
