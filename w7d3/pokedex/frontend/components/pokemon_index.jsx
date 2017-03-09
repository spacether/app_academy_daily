import React from 'react';

import PokemonIndexItem from './pokemon_index_item';

class PokemonIndex extends React.Component {
  componentDidMount () {
    this.props.fetchAllPokemon();
  }



  render () {
    let pokemon = [];
    if (this.props.pokemon.length > 0) {
      pokemon = this.props.pokemon.map( poke => (
        <PokemonIndexItem poke={poke} key={poke.id} />
      ));
    }
    return(
      <section className="pokedex">
        <ul>
          {pokemon}
        </ul>
      </section>

    );
  }
}

export default PokemonIndex;
