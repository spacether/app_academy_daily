import { RECEIVE_BENCHES, RECEIVE_BENCH }
  from '../actions/bench_actions';

import { merge } from 'lodash';

const defaultState = {};

export default (state = defaultState, action) => {
  let newState = merge({}, state);
  switch (action.type) {
    case RECEIVE_BENCHES:
      return action.benches;
    case RECEIVE_BENCH:
      newState[action.bench.id] = action.bench;
      return newState;
    default:
      return state;
  }
};
