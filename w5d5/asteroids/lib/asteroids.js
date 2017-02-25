const GameView = require("./game_view.js");
const Game = require("./game.js");

document.addEventListener("DOMContentLoaded", function(event) {
  let ctx = document.getElementById("game-canvas").getContext("2d");
  let game = new Game();
  let view = new GameView(game, ctx);
  view.start();
});
