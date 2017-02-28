const HanoiGame = require('./game.js');
const HanoiView = require('./hanoi-view.js');

$( () => {

  const rootEl = $('.hanoi');
  const game = new HanoiGame();
  console.log(game);
  const view = new HanoiView(game, rootEl);
  $('button').on('click', () => {
    view.resetGame();
  });
});
