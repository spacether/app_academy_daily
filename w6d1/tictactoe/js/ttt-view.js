class View {
  constructor(game, $el) {
    this.game = game;
    this.$container = $el;
    this.setupBoard();
    this.bindEvents();
  }

  bindEvents() {
    $("li").on("click", event => {
      let $obj = $(event.currentTarget);
      let pos = $obj.attr('pos').split(',');
      pos = pos.map( num => { return parseInt(num); });
      let mark = this.game.currentPlayer;
      this.game.playMove(pos);
      this.makeMove($obj, mark);
    });
  }

  makeMove($square, mark) {
    $square.addClass(mark);
    if (this.game.isOver()) {
      this.game.board.print();
      let msg = 'NO ONE WINS!';
      if (this.game.winner()) {
        msg = `${this.game.winner()} has won!`;
      }
      let $caption = (`<figcaption>${msg}</figcaption>`);
      this.$container.append($caption);
    }
  }

  setupBoard() {
    let lis = '<li pos="0,0"></li><li pos="0,1"></li><li pos="0,2"></li>';
    lis += '<li pos="1,0"></li><li pos="1,1"></li><li pos="1,2"></li>';
    lis += '<li pos="2,0"></li><li pos="2,1"></li><li pos="2,2"></li>';
    let $board = $(`<ul>${lis}</ul>`);
    this.$container.append($board);
  }
}

module.exports = View;
