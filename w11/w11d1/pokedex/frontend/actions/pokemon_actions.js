export const RECEIVE_ALL_POKEMONS = "RECEIVE_ALL_POKEMONS";

export const receiveAllPokemons = (pokemons) => ({
    type: RECEIVE_ALL_POKEMONS,
    pokemons
});