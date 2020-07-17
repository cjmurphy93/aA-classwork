import {merge} from 'lodash';
import {ADD_TODO, CLEAR_ALL} from '../actions/todo_actions';

const todoReducer = (state= {}, action) => {
    Object.freeze(state);

    switch(action.type) {
        case ADD_TODO:
            const { key, title, body, done} = action;
            const newTodo = {
                [key] : {
                    title,
                    body,
                    done,
                    id: key
                }
            };
            const newState = merge({}, state, newTodo);
            
            return newState;

        case CLEAR_ALL:
            return {};

        default:
            return state;
    }
};

export default todoReducer;