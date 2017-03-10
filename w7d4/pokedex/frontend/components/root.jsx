import React from 'react';
import { Provider } from 'react-redux';
import PokemonIndexContainer from './pokemon_index_container';
import PokemonDetailContainer from './pokemon_detail_container';
import PokeFormContainer from './poke_form_container';
import ItemDetailContainer from './item_detail_container';
import { Router, Route, hashHistory, IndexRoute } from 'react-router';

const Root = ({ store }) => (
  <Provider store={ store }>
    <Router history={ hashHistory }>
      <Route path="/" component={ PokemonIndexContainer }>
        <IndexRoute component={ PokeFormContainer } />
        <Route path="/pokemon/:id" component={ PokemonDetailContainer }>
          <Route path='item/:item_id' component={ ItemDetailContainer }/>
        </Route>
      </Route>
    </Router>
  </Provider>
);

export default Root;
