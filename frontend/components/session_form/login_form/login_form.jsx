import React from 'react';
import { withRouter } from 'react-router-dom';

class LoginForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      email: '',
      password: ''
    };
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  updateInput(input) {
    return e => {
      this.setState({ [input]: e.currentTarget.value });
    };
  }

  handleSubmit(e) {
    e.preventDefault();
    const user = Object.assign({}, this.state);
    this.props.login(user);
  }

  renderErrors() {
    return(
      <ul className='login-form-errors'>
        {this.props.errors.map((error, i) => (
          <li key={`error-${i}`}>
            {error}
          </li>
        ))}
      </ul>
    );
  }

  render () {
    return (
      <div className='login-form'>
        {this.props.errors.length > 0 ? this.renderErrors() : ''}
        <form onSubmit={this.handleSubmit}>
          <ul>
            <label className='login-form-label'> Email <br />
              <input
                onChange={this.updateInput('email')}
                type="text"
                value={this.state.email}
                ></input>
            </label>
         </ul>
         <ul>
            <label className='login-form-label'> Password <br />
              <input
                onChange={this.updateInput('password')}
                type="password"
                value={this.state.password}
                ></input>
            </label>
        </ul>
        <button className='login-form-button' onClick={() => this.props.login(this.state)}>Log In</button>
        </form>
      </div>
    );
  }
}

export default LoginForm;