import React from 'react';
import { Link } from 'react-router';

const PokemonIndexItem = ({poke}) => {
  return(
    <li>
      <Link to={`/pokemon/${poke.id}`} >
        <span> {poke.id} </span>
        <img className='poke' src={poke.image_url} />
        <span> {poke.name}</span>
      </Link>
    </li>
  );
};


export default PokemonIndexItem;
