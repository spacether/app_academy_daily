import React from 'react';

const PokemonIndexItem = (props) => {
  let {poke} = props;
  return(
    <li>
      <a>
        <span>  {poke.id}   </span>
        <img className='poke' src={poke.image_url} />
        <span>   {poke.name}</span>
      </a>
    </li>
  );
};


export default PokemonIndexItem;
