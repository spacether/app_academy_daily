const View = require("./ttt-view.js"); // require appropriate file
const Game = require("./game.js"); // require appropriate file

$( () => {
  let g = new Game();
  let $container = $('.ttt');
  let $v = new View(g, $container);

  // Your code here
});
