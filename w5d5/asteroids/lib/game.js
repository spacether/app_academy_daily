const Asteroid = require("./asteroid.js");

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
