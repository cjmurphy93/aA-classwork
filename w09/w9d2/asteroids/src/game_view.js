const Game = require("./game.js");

function GameView(ctx, game) {
    this.game = game;
    this.ctx = ctx;
}

GameView.prototype.start = function() {
    setInterval(function(){
        this.game.moveObjects();
        this.game.draw(this.ctx)}, 20);
}

module.exports = GameView;