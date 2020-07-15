import React from 'react';
import * as Minesweeper from './minesweeper';

class Tile extends React.Component {
    constructor(props) {
        super(props);
        // this.state = {
        //     tile: new Minesweeper.Tile()                // BOARD, POS PASS THAT IN
        // }; don't set anything in state as something from props
        this.handleClick = this.handleClick.bind(this);
    }

    handleClick(e) {
        e.preventDefault();
        let flag = false;
        if (e.altKey) flag = true;
        this.props.updateGame(this.props.tile, flag);
    }

    render() {
        let icon = "";
        let status = "unexplored";
        let tile = this.props.tile;
        if (tile.explored) {
            if (tile.bombed) {
                icon = '💣';
                status = "bombed";
            }
            else {
                icon = `${tile.adjacentBombCount()}`;
                status = "explored";
            }
        };
        if (tile.flagged) {
            icon = '🚩';
            status = "flagged";
        }

    return <div className={'tile ' + status} onClick={this.handleClick}>{icon}</div>;

        
    };
}

export default Tile;


// function ActionLink() {
//   function handleClick(e) {
//     e.preventDefault();
//     console.log('The link was clicked.');
//   }

//   return (
//     <a href="#" onClick={handleClick}>
//       Click me
//     </a>
//   );
// }