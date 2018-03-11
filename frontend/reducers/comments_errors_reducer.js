import {
  RECEIVE_COMMENT_ERRORS,
  CLEAR_ERRORS
} from '../actions/post_actions';

const postErrorsReducer = (state = [], action) => {
  Object.freeze(state);
  switch (action.type) {
    case RECEIVE_COMMENT_ERRORS:
      return action.errors;
    case CLEAR_ERRORS:
      return [];
    default:
      return state;
  }
};

export default postErrorsReducer;
