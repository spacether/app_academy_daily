import SessionForm from './session_form';
import { connect } from 'react-redux';
import { signup, login } from '../../actions/session_actions';

const mapStateToProps = ({session}, ownProps) => ({
  loggedIn: Boolean(session.currentUser),
  errors: session.errors,
  formType: ownProps.location.pathname
});

const mapDispatchToProps = (dispatch, ownProps) => {
  let func = (ownProps.location.pathname === "/signup") ? signup : login;
  return { processForm: (user) => dispatch(func(user)) };
};

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(SessionForm);
