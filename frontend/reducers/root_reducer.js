import { combineReducers } from 'redux';
import sessionReducer from './session_reducer';
import sessionErrorsReducer from './session_errors_reducer';
import postReducer from './post_reducer';
import usersReducer from './users_reducer';
import uiReducer from './ui_reducer';
import postErrorsReducer from './post_errors_reducer';
import userErrorsReducer from './user_errors_reducer';
import commentReducer from './comments_reducer';
import commentErrorsReducer from './comments_errors_reducer';

const RootReducer = combineReducers({
  session: sessionReducer,
  errors: sessionErrorsReducer,
  posts: postReducer,
  users: usersReducer,
  userErrors: userErrorsReducer,
  ui: uiReducer,
  postErrors: postErrorsReducer,
  comments: commentReducer,
  commentErrors: commentErrorsReducer
});

export default RootReducer;
