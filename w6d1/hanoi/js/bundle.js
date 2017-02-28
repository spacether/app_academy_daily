/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};

/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {

/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId])
/******/ 			return installedModules[moduleId].exports;

/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			exports: {},
/******/ 			id: moduleId,
/******/ 			loaded: false
/******/ 		};

/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);

/******/ 		// Flag the module as loaded
/******/ 		module.loaded = true;

/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}


/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;

/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;

/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";

/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(0);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ function(module, exports, __webpack_require__) {

	const HanoiGame = __webpack_require__(1);
	const HanoiView = __webpack_require__(2);

	$( () => {

	  const rootEl = $('.hanoi');
	  const game = new HanoiGame();
	  console.log(game);
	  const view = new HanoiView(game, rootEl);
	  $('button').on('click', () => {
	    view.resetGame();
	  });
	});


/***/ },
/* 1 */
/***/ function(module, exports) {

	class Game {
	  constructor() {
	    this.towers = [[3, 2, 1], [], []];
	  }

	  isValidMove(startTowerIdx, endTowerIdx) {
	      const startTower = this.towers[startTowerIdx];
	      const endTower = this.towers[endTowerIdx];

	      if (startTower.length === 0) {
	        return false;
	      } else if (endTower.length == 0) {
	        return true;
	      } else {
	        const topStartDisc = startTower[startTower.length - 1];
	        const topEndDisc = endTower[endTower.length - 1];
	        return topStartDisc < topEndDisc;
	      }
	  }

	  isWon() {
	      // move all the discs to the last or second tower
	      return (this.towers[2].length == 3) || (this.towers[1].length == 3);
	  }

	  move(startTowerIdx, endTowerIdx) {
	      if (this.isValidMove(startTowerIdx, endTowerIdx)) {
	        this.towers[endTowerIdx].push(this.towers[startTowerIdx].pop());
	        return true;
	      } else {
	        return false;
	      }
	  }

	  print() {
	      console.log(JSON.stringify(this.towers));
	  }

	  promptMove(reader, callback) {
	      this.print();
	      reader.question("Enter a starting tower: ", start => {
	        const startTowerIdx = parseInt(start);
	        reader.question("Enter an ending tower: ", end => {
	          const endTowerIdx = parseInt(end);
	          callback(startTowerIdx, endTowerIdx);
	        });
	      });
	  }

	  run(reader, gameCompletionCallback) {
	      this.promptMove(reader, (startTowerIdx, endTowerIdx) => {
	        if (!this.move(startTowerIdx, endTowerIdx)) {
	          console.log("Invalid move!");
	        }

	        if (!this.isWon()) {
	          // Continue to play!
	          this.run(reader, gameCompletionCallback);
	        } else {
	          this.print();
	          console.log("You win!");
	          gameCompletionCallback();
	        }
	      });
	  }
	}

	module.exports = Game;


/***/ },
/* 2 */
/***/ function(module, exports) {

	class View {
	  constructor(game, $el) {
	    this.game = game;
	    this.$el = $el;
	    this.setupTowers();
	    this.render();
	    this.selected = [];
	  }

	  setupTowers() {
	    let tower = '<ul><li></li><li></li><li></li></ul>';
	    for (let i = 0; i < 3; i++) {
	      let $tower = $(tower);
	      this.$el.append($tower);
	      $tower.on("click", event => { this.clickTower(i); });
	    }
	  }

	  clickTower(tower){
	    $('figcaption').text("");
	    $('ul').eq(tower).addClass("selected");
	    this.selected.push(tower);
	    if (this.selected.length === 2) {
	      let moved = this.game.move(...this.selected);
	      if (moved) {
	        this.render();
	        if (this.game.isWon()) {
	          $('figcaption').text("You WON!");
	        }
	      } else {
	        $('figcaption').text("Invalid Move!");
	      }
	      this.selected = [];
	      $('ul').removeClass('selected');
	    }
	  }

	  resetGame() {
	    $('figcaption').text("");
	    this.game.towers = [[3, 2, 1], [], []];
	    this.render();
	  }

	  render() {
	    let hash = {1: 'small', 2: 'med', 3: 'large'};
	    let $uls = $("ul");
	    for (let i = 0; i < this.game.towers.length; i++) {
	      let tower = this.game.towers[i];
	      for (let j = 0; j < 3; j++) {
	        if (j < tower.length) {
	          let discSize = tower[j];
	          let classString = hash[discSize];
	          $uls.eq(i).children().eq(2 - j).addClass(classString);
	        } else {
	          $uls.eq(i).children().eq(2 - j).removeClass("small med large");
	        }
	      }
	    }
	  }
	}

	module.exports = View;


/***/ }
/******/ ]);