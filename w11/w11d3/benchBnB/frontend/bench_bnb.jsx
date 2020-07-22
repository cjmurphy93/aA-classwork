
import React from "react";
import ReactDOM from "react-dom";
import * as util from './util/session_api_util';
import configureStore from './store/store';

document.addEventListener("DOMContentLoaded", () => {
    const root = document.getElementById("root");
    const store = configureStore();
    window.getState = store.getState;
    window.dispatch = store.dispatch;
    window.login = util.login;
    window.logout = util.logout;
    window.signUp = util.signUp;
    ReactDOM.render(<h1>Welcome to BenchBnB</h1>, root);

});