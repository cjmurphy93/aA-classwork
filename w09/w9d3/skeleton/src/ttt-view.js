class View {
  constructor(game, $el) {
    this.game = game;
    this.$el = $el;
    this.setupBoard();
    this.bindEvents();
  }

  bindEvents() {
    this.$el.on("click", "li", event =>{
    const $square = $(event.currentTarget);
    // debugger
    this.makeMove($square);    
    })
  }

  makeMove($square) {
    if (this.game.board.isEmptyPos($square.data("pos"))) {
      $square.addClass(this.game.currentPlayer);
      this.game.playMove($square.data("pos"));
      if (this.game.isOver()) {
        console.log(`${this.game.winner()} wins!`);
        const $h1 = $('<h1>');
        $h1.text(`${this.game.winner()} wins!`);
        this.$el.append($h1);
      };
    } else {
      
        const $h2 = $('<h2>');
        $h2.text('Space taken!');
        this.$el.append($h2);
      
    };
  }

  setupBoard() {
    const $ul = $('<ul>');
    for (let row = 0; row < 3; row++){
      for (let col = 0; col < 3; col++) {
        let $li = $('<li>');
        $li.data("pos", [row, col]);
        $ul.append($li);
      }
    };
    this.$el.append($ul);
    
  }
}

module.exports = View;
