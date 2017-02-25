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
