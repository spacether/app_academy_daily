import React from 'react';
import { Link } from 'react-router';


class PokemonDetail extends React.Component {
  componentDidMount() {
    this.props.fetchOnePokemon(this.props.params.id);
  }
  componentWillReceiveProps(newProps) {
    let {id} = newProps.params;
    if (this.props.params.id !== id) {
      this.props.fetchOnePokemon(id);
    }
  }
  render () {
    let {poke} = this.props;
    if (Object.keys(poke).length !== 0) {
      return (
        <div className='pokedetail'>
          <div className='container'>
            <figure className='image-container'>
              <img src={poke.image_url}></img>
            </figure>
          </div>

          <h2>{poke.name}</h2>
          <h3>Attack: {poke.attack}</h3>
          <h3>Defense: {poke.defense}</h3>
          <h3>Moves: {poke.moves.join(", ")}</h3>
          <h3>Type: {poke.poke_type}</h3>
          <div className='item-container'>
            <h3>Items</h3>
            <div>
              <ul className='item'>
                {poke.items.map( item => (
                  <li key={item.id}>
                    <Link to={`/pokemon/${poke.id}/item/${item.id}`}>
                      <img src={item.image_url} />
                    </Link>
                  </li>)
                )}
                {this.props.children}
              </ul>
            </div>

          </div>
        </div>
      );
    }
    return null;
  }
}

export default PokemonDetail;
