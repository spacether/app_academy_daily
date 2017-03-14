export const RECEIVE_BENCHES = "RECEIVE_BENCHES";
export const RECEIVE_BENCH = "RECEIVE_BENCH";
import * as API from '../util/benches_api';
// import receiveErrors from './session_actions';

// regular actions
export const receiveBenches = (benches) => ({
  type: RECEIVE_BENCHES,
  benches
});

export const receiveBench = (bench) => ({
  type: RECEIVE_BENCH,
  bench
});

// async actions
export const fetchBenches = () => dispatch => (
  API.fetchBenches()
  .then(benches => dispatch(receiveBenches(benches)))
  .fail(data => dispatch(console.log(data.responseJSON)))
);

// async actions
export const fetchBench = (bench) => dispatch => (
  API.fetchBench(bench)
  .then(realbench => dispatch(receiveBench(realbench)))
  .fail(data => dispatch(console.log(data.responseJSON)))
);
