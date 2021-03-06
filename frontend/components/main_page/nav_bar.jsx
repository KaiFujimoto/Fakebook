import React from 'react';
import { Link } from 'react-router-dom';
import { Dropdown, DropdownToggle, DropdownMenu, DropdownItem } from 'reactstrap';
import NavBarDropdownMenuContainer from './nav_bar_dropdown_menu_container';
import AutoSuggestSearchContainer from './auto_suggest_search_container';

class NavBar extends React.Component {
  constructor(props) {
    super(props);
    this.state = this.props.currentUser;
  }

  render () {
    return (
        <nav className="main-page-nav">
          <div className="main-page-nav-inside">
            <h1 className='logo-and-search-bar'>
              <button>
                <Link to='/feed'>a</Link>
              </button>
              <AutoSuggestSearchContainer />
            </h1>
            <div className="main-page-nav-right-side">
              <ul className="main-page-nav-ul">
                <Link to={`/profile/${this.props.currentUser.id}`}>
                  <button className="main-page-nav-ul-button">
                    <span className="main-page-nav-ul-span">
                      <img src={this.props.currentUser.image_url}></img>
                    </span>
                    {this.props.currentUser.first_name}
                  </button>
                </Link>
                <div className='random-break-div'></div>
                <ul className="main-page-nav-ul-home">
                  <button className="main-page-nav-ul-button-home">
                    <Link to='/feed'>Home</Link>
                  </button>
                </ul>
              </ul>
              <ul className="nav-bar-pics">
                <NavBarDropdownMenuContainer users={this.props.users}/>
              </ul>
              <ul>
                <li className="nav-bar-main-button">
                  <button onClick={() => this.props.logout()}>Logout</button>
                </li>
              </ul>
            </div>
          </div>
        </nav>
    );
  }
}

export default NavBar;
