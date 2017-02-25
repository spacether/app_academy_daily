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
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};

/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);

/******/ 		// Flag the module as loaded
/******/ 		module.l = true;

/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}


/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;

/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;

/******/ 	// identity function for calling harmony imports with the correct context
/******/ 	__webpack_require__.i = function(value) { return value; };

/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, {
/******/ 				configurable: false,
/******/ 				enumerable: true,
/******/ 				get: getter
/******/ 			});
/******/ 		}
/******/ 	};

/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};

/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };

/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";

/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = 5);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ (function(module, exports) {

const Util = {
  inherits(child, parent) {
    function Surrogate(){}
    Surrogate.prototype = parent.prototype;
    child.prototype = new Surrogate();
    child.prototype.constructor = child;
  },
  distance(pt1, pt2) {
    let xterm = Math.pow(pt1[0] - pt2[0], 2);
    let yterm = Math.pow(pt1[1] - pt2[1], 2);
    return Math.sqrt(xterm + yterm);
  },
  normal(speedVect) {
    return this.distance([0,0], speedVect);
  },
  scale (vec, m) {
    return [vec[0] * m, vec[1] * m];
  }
};

module.exports = Util;


/***/ }),
/* 1 */
/***/ (function(module, exports, __webpack_require__) {

const Asteroid = __webpack_require__(3);

function Game() {
  this.DIM_X = document.getElementById("game-canvas").width;
  this.DIM_Y = document.getElementById("game-canvas").height;

  this.NUM_ASTEROIDS = 10;
  this.asteroids = [];
  this.addAsteroids();
}

Game.prototype.addAsteroids = function() {
  for(let i=0; i<this.NUM_ASTEROIDS; i++) {
    let x = Math.random()*this.DIM_X;
    let y = Math.random()*this.DIM_Y;
    this.asteroids.push(
      new Asteroid( {pos: [x, y], wrapper: this.wrap.bind(this)} )
    );
  }
};

Game.prototype.draw = function(ctx) {
  ctx.clearRect(0, 0, this.DIM_X, this.DIM_Y);
  this.asteroids.forEach(
    function(ast) {
      ast.draw(ctx);
    });
};

Game.prototype.moveObjects = function() {
  this.asteroids.forEach(
    function(ast) { ast.move();
    });
};

Game.prototype.wrap = function(pos) {
  // if neg, flip to max
  let maxsize = {0: this.DIM_X, 1: this.DIM_Y};
  return pos.map( function(value, ind) {
    return (value < 0) ? value + maxsize[ind] : value % maxsize[ind];
    });
};

Game.prototype.checkCollisions = function () {
  let removals = [];
  for(let i = 0; i < this.asteroids.length-1; i++) {
    for (let j = i+1; j < this.asteroids.length; j++) {
      if(this.asteroids[i].isCollidedWith(this.asteroids[j])) {
        //alert("COLLISION");
        removals.push(i);
        removals.push(j);
      }
    }
  }
  removals.forEach(this.remove.bind(this));
};

Game.prototype.remove = function(index) {
  this.asteroids.splice(index, 1);
};

Game.prototype.step = function() {
  this.moveObjects();
  this.checkCollisions();
};

module.exports = Game;


/***/ }),
/* 2 */
/***/ (function(module, exports) {

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


/***/ }),
/* 3 */
/***/ (function(module, exports, __webpack_require__) {

const Util = __webpack_require__(0);
const MovingObject = __webpack_require__(4);

function Asteroid(hash) {
  let options =  {pos: hash.pos,
                  vel: this.randomVec(5),
                  radius: 15,
                  color: "blue",
                  wrapper: hash.wrapper
                };
  MovingObject.call(this, options);
}
// protos have to happen down here
Util.inherits(Asteroid, MovingObject);

module.exports = Asteroid;


/***/ }),
/* 4 */
/***/ (function(module, exports, __webpack_require__) {

const Util = __webpack_require__(0);

function MovingObject(options = {}) {
  this.pos = options.pos;
  this.vel = options.vel;
  this.radius = options.radius;
  this.color = options.color;
  this.wrapper = options.wrapper;
}

MovingObject.prototype.draw = function(ctx) {
  ctx.fillStyle = this.color;
  ctx.beginPath();

  ctx.arc(
    this.pos[0],
    this.pos[1],
    this.radius,
    0,
    2 * Math.PI,
    false
  );

  ctx.fill();
};

MovingObject.prototype.move = function() {
  let newx = this.pos[0] + this.vel[0];
  let newy = this.pos[1] + this.vel[1];
  //this.pos = [newx, newy];
  this.pos = this.wrapper([newx, newy]);
};

MovingObject.prototype.randomVec = function (length) {
  const deg = 2 * Math.PI * Math.random();
  return Util.scale([Math.sin(deg), Math.cos(deg)], length);
};

MovingObject.prototype.isCollidedWith = function (other) {
  let distance = Util.distance(this.pos, other.pos);
  return (distance <= (this.radius + other.radius));
};

module.exports = MovingObject;


/***/ }),
/* 5 */
/***/ (function(module, exports, __webpack_require__) {

const GameView = __webpack_require__(2);
const Game = __webpack_require__(1);

document.addEventListener("DOMContentLoaded", function(event) {
  let ctx = document.getElementById("game-canvas").getContext("2d");
  let game = new Game();
  let view = new GameView(game, ctx);
  view.start();
});


/***/ })
/******/ ]);