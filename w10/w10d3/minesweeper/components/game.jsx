import React from 'react';
import * as Minesweeper from './minesweeper';
import Tile from './tile';
import Board from './board';

class Game extends React.Component {
    constructor(props){
        super(props);
        this.state = {board: new Minesweeper.Board(4, 2)};
        this.updateGame = this.updateGame.bind(this);    // Why bind
        this.restartGame = this.restartGame.bind(this);
    }

    updateGame(tile, flag) {
        // this.setState(board)
        if (flag) {
            tile.toggleFlag();
        } else {
            tile.explore();
        };
        this.setState({board: this.state.board});
    }

    restartGame(e)  {
        e.preventDefault();
        this.setState({board: new Minesweeper.Board(5,2)})
    }

    render() {
        // this.updateGame(); 
        let status = "noshow";

        if (this.state.board.lost()) {
            status = "lost";
        }
        else if (this.state.board.won()) {
            status = "won";
        }


        // debugger; Is render inside of render ok?
        // const tile = new Tile();
        return (
            <>
                <h1 className="gameTitle">Minesweeper!</h1>
                <div className="game">
                    <Board board={this.state.board} updateGame={this.updateGame}/>
                </div>
                <div className={status}>
                    <form className="modal-form">
                        <h3>You {status}</h3>
                        <br/>
                        <input onClick={this.restartGame} type="submit" id="restart" value="restart game"/>
                    </form>
                    <div className="modal-screen"></div>
                </div>
            </>
        )
    }
}

export default Game;



// import * as myModule from '/modules/my-module.js';