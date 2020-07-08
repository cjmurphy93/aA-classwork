const View = require("./ttt-view.js");
const Game = require("../../solution/game.js");      //How to access other folders?


$(() => {
  // debugger
  const $el = $(".ttt");
  const game = new Game();
  const view = new View(game, $el);
  });
