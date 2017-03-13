import React from 'react';
import { Link } from 'react-router';

const Greeting = (props) => {
  if (props.currentUser) {
    return (
      <div>
        <h3>Welcome {props.currentUser.username}</h3>
        <button onClick={props.logout}>Log Out</button>
      </div>
    );
  } else {
    return (
      <div>
        <Link to='/signup'>Sign Up</Link> <Link to='/login'>Log In</Link>
      </div>
    );
  }
};

export default Greeting;
