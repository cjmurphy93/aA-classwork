
import React from 'react';
import * as Minesweeper from './minesweeper';
import Tile from './tile';

class Board extends React.Component {
    constructor(props) {
        super(props);
    }


    render () {

        const grid = this.props.board.grid.map ((row, idx1) => {
            let row_li = row.map ((tile, idx2 ) => {
                // let tile = new Tile(tile, updateGame);
                // return <li key={idx1, idx2}> tile </li>;

                return <Tile key={[idx1, idx2]} tile={tile} updateGame={this.props.updateGame} /> 
            });
            return <div key={idx1} className="row">{row_li}</div>;
        });
        return <div className="board">{grid}</div>;
    }




}

export default Board;


// import React, { Component } from 'react';

// class App extends Component {
//     render() {
//         const greeting = 'Welcome to React';

//         return (
//             <div>
//                 <Greeting greeting={greeting} />
//             </div>
//         );
//     }
// }

// class Greeting extends Component {
//     render() {
//         return <h1>{this.props.greeting}</h1>;
//     }
// }

// export default App;