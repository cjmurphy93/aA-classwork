import React from 'react';
import PokemonIndexItem from './pokemon_index_item';

class PokemonIndex extends React.Component {
    componentDidMount() {
        
        this.props.requestAllPokemon();
    }

    render() {
        const { pokemon } = this.props;

        // const pokeList = pokemon.map(poke => {
        //     return( 
        //         <li key={poke["id"]}>
        //         {poke.name}
        //         <img src={poke.image_url} className="small-image" />
        //         </li>
        // )});
        // return <ul>{pokeList}</ul>

        const pokemonItems = pokemon.map(poke => (
            <PokemonIndexItem key={poke.id} pokemon={poke} />
        ));

        // And inside the render:
        return (<section className="pokedex">
            <ul>{pokemonItems}</ul>
            </section>);
    }
};

export default PokemonIndex;