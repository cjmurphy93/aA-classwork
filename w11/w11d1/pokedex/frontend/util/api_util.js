export const fetchAllPokemons = () => (
    $.ajax({
        method: 'GET',
        url: "/api/pokemons"
    })
);