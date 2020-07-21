export const fetchAllPokemon = () => (
    $.ajax({
        method: 'GET',
        url: "/api/pokemon"
    })
);

// this is a promise, asynch request 