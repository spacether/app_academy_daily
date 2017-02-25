const Util = require("./util.js");
const MovingObject = require("./moving_objects.js");

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
