import React from 'react';
import { Link } from "react-router-dom";

const PokemonIndexItem = ({ pokemon }) => {
        return (
            <Link to={`/pokemon/${pokemon.id}`}>
                <li
                    key={pokemon.id}>
                    {pokemon.name}
                    <img src={pokemon.image_url} className="small-image" />
                </li>
            </Link>
        );
    }

export default PokemonIndexItem;

// import React from "react";
// import UsernameUpdateForm from "./username_update_form";
// const UserIndexItem = ({ user }) => {
//     return (
//         <div>
//             <h1>{user.username}</h1>
//             <UsernameUpdateForm user={user} />
//         </div>
//     );
// };
// export default UserIndexItem;