const Util = require("./util.js");

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
