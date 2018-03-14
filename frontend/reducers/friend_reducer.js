import {
  RECEIVE_ALL_PENDING_FRIENDS,
  RECEIVE_FRIEND_REQUEST,
  REMOVE_FRIEND_REQUEST
} from '../actions/friend_actions';

import merge from 'lodash/merge';

const friendReducer = (state = {}, action) => {
  Object.freeze(state);
  switch (action.type) {
    case RECEIVE_FRIEND_REQUEST:
      return action.payload;
    case REMOVE_FRIEND_REQUEST:
      let newState = merge({}, state);
      delete newState[action.payload];
      return newState;
    default:
      return state;
  }
};

export default friendReducer;
