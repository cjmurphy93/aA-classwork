import React from 'react';
import {Link} from 'react-router-dom';

export default ({currentUser, logout}) => {
    const display = currentUser ? (
        <div>
            <h3>Welcome {currentUser.username}!</h3>
            <button onClick={logout}>Logout</button>
        </div>
    ) : (
        <div>
            <Link className="btn" to="/signup">Sign Up</Link>
            <Link className="btn" to="/login">Log In</Link>
        </div>
    );
    return (
        <header className="greeting">
            <div>
                {display}
            </div>
        </header>
    )
}