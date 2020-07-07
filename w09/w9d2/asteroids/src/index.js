const MovingObject = require("./moving_objects.js");
const Asteroid = require("./asteroids.js");
const GameView = require("./game_view.js");
const Game = require("./game.js");


document.addEventListener("DOMContentLoaded", () => { //for our document object, which is index.html, when it gets loaded up, fires up an event called DOM content loaded, callback gets invoked
    console.log("Webpack is working!!!!!!!");
    const canvasEl = document.getElementById("game-canvas");
    canvasEl.height = window.innerHeight;
    canvasEl.width = window.innerWidth;
    const ctx = canvasEl.getContext('2d');
    window.ctx = ctx;   //these must be inside event listener because they are initialized inside callback
    window.canvasEl = canvasEl;
    const game = new Game();
    const gv = new GameView(ctx, game);
    gv.start();
    window.game = game;
    window.gv = gv;
    window.GameView = GameView;
} );

window.MovingObject = MovingObject;
window.Asteroid = Asteroid;
// window.GameView = GameView;
// window.Game = Game;