import { RECEIVE_ALL_POKEMONS } from "../actions/pokemon_actions";

const pokemonsReducer = (state = {}, action) => {
    Object.freeze(state);

    switch(action.type) {
        case RECEIVE_ALL_POKEMONS:
            return Object.assign({}, state, action.pokemons);
        default:
            return state;
    };
};

export default pokemonsReducer;