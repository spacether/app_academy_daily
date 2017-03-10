import React from 'react';

const ItemDetail = ({ item }) => (
  <div>
  <h3>{item.name}</h3>
  <h4>Happiness: {item.happiness}</h4>
  <h4>Price: ${item.price}</h4>
  </div>
);

export default ItemDetail;
