import { connect } from 'react-redux';
import ItemDetail from './item_detail';

const mapStateToProps = (state, ownProps) => {
  let id = ownProps.params.item_id;
  let item = state.pokemonDetail.items.filter(el => (el.id === parseInt(id) ))[0];
  return { item: item };
};

export default connect(mapStateToProps, null)(ItemDetail);
