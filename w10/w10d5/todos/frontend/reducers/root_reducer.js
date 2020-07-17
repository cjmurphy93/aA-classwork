import { combineReducers } from 'redux';
import todosReducer from './todos_reducer';


const rootReducer = combineReducers({
    todos: todosReducer
});

// const rootReducer = todosReducer;

export default rootReducer;