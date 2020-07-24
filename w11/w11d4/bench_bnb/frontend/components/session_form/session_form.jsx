import React from 'react';
import {Link} from 'react-router-dom';

class SessionForm extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            username: "",
            password: ""
        };
        this.handleSubmit = this.handleSubmit.bind(this);
    };

    handleInput(type) {
        return (e) => {
            this.setState({ [type]: e.target.value});
        };
    };

  handleSubmit(e) {
    e.preventDefault();
    const user = Object.assign({}, this.state);
    this.props.processForm(user);
  }


    handleErrors() {
        return (
            <ul>
                {this.props.errors.map((error, i) => (
                    <li key={`${i}_error`}>
                        {error}
                    </li>
                ))}
            </ul>
        );
    }

    render() {
        const {formType} = this.props;

        const prettyFT = formType === 'login' ? ('Log In') : ('Sign Up');

        const oppForm = formType === 'login' ? ("/signup") : ("/login");

        const oppPretty = formType === 'login' ? ('Sign Up') : ('Log In');

        return (
            <div className="session-form-header">
                 <form onSubmit={this.handleSubmit} className={formType}>
                     {prettyFT} or <Link className="btn" to={oppForm}>{oppPretty}</Link>
                     {this.handleErrors()}
                     
                    <br/>
                     <div>
                         <label>Username:
                             <input type="text"
                              value={this.state.username}
                            onChange={this.handleInput('username')}
                            className="username-input"
                            />
                         </label>
                         <br/>
                         <label>Password:
                             <input type="password"
                             value={this.state.password}
                             onChange={this.handleInput('password')}
                             className="password-input"
                             />
                         </label>
                         <br/>
                         <input className="session-submit" type="submit" value={prettyFT} />
                     </div> 

                 </form>
             </div>
         );

     }

 }

 


export default SessionForm;