Function.prototype.inherits = function(parent) {
  function Surrogate(){}
  Surrogate.prototype = parent.prototype;
  this.prototype = new Surrogate();
  this.prototype.constructor = this;
  /*
  this.prototype = Object.create(parent.prototype);
  this.prototype.constructor = this;
  */
};

function MovingObject() {}
MovingObject.prototype.move = function() {
  console.log("I'm moving!");
};

function Ship() {}
Ship.inherits(MovingObject);
Ship.prototype.haul = function() {
  console.log("I'm hauling cargo!");
};

function Asteroid () {}
Asteroid.inherits(MovingObject);
Asteroid.prototype.hit = function() {
  console.log("I kill dinosaurs!");
};


let m = new MovingObject();
m.move();

let s = new Ship();
s.move();
s.haul();

let a = new Asteroid();
a.move();
a.hit();
