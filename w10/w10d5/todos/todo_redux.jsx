import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './frontend/store/store';
import App from './frontend/components/app';
import Root from './frontend/components/root';
import { receiveTodo, receiveTodos, clearAll } from './frontend/actions/todo_actions'
import {allTodos} from './frontend/reducers/selectors';

document.addEventListener("DOMContentLoaded", function(){
    const root = document.getElementById('root');
    const store = configureStore;
    window.store = store;
    window.receiveTodos = receiveTodos;
    window.receiveTodo = receiveTodo;
    window.clearAll = clearAll;
    window.allTodos = allTodos;

    ReactDOM.render(<Root store={store} />, root);
})