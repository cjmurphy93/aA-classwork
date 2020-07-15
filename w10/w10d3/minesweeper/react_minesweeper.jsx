import React from 'react';
import ReactDOM from 'react-dom';
import Game from './components/game';


document.addEventListener("DOMContentLoaded", () => {
    ReactDOM.render(<Game/>, document.getElementById("root"));
});

// const root = document.getElementById("root");
// ReactDOM.render(<App name='Leo' />, root); // ReactDom.render can only take a single React component
