import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './frontend/store/store';
import { receiveToDo, receiveToDos, clearAll } from './frontend/actions/todo_actions'


document.addEventListener("DOMContentLoaded", function(){
    const root = document.getElementById('root');
    const store = configureStore;
    window.store = store;
    window.receiveToDos = receiveToDos;
    window.receiveToDo = receiveToDo;

    ReactDOM.render(<h1>Todos App</h1>, root);
})