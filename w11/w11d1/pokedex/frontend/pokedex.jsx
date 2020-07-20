import React from 'react';
import ReactDOM from 'react-dom';
import * as apiUtils from './util/api_util'
import { receiveAllPokemons} from './actions/pokemon_actions'
import configureStore from './store/store'

document.addEventListener('DOMContentLoaded', () => {
    const store = configureStore({});
    const rootEl = document.getElementById('root');
    window.receiveAllPokemon = receiveAllPokemons;
    window.fetchAllPokemon = apiUtils.fetchAllPokemons; 
    window.getState = store.getState;
    window.dispatch = store.dispatch;
    ReactDOM.render(<h1>Pokedex</h1>, rootEl);
})