function GameView(game, ctx) {
  this.game = game;
  this.ctx = ctx;
}

GameView.prototype.start = function() {
  //setInterval(this.game.moveObjects, 32);
  setInterval(function() {
    this.game.step();
    this.game.draw(this.ctx);
  }.bind(this), 32);
};

module.exports = GameView;
