import React from 'react';
import { Provider } from 'react-redux';
import PokemonIndexContainer from './pokemon/pokemon_index_container'
// import PokemonDetail from './pokemon/pokemon_detail'
import { HashRouter, Route } from 'react-router-dom';

const Root = ({ store }) => (
    <Provider store={store}>
        <HashRouter>
            <>
                {/* <Route path="/pokemon/:pokemonId" component={PokemonDetail} />    */}
                <Route path="/" component={PokemonIndexContainer} />   
            </>
        </HashRouter>
    </Provider>
);

export default Root;