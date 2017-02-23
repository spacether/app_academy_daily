function fake(value, ind, arr) {
  console.log(value);
}

Array.prototype.myEach = function (callback) {
  for(let i=0; i < this.length; i++) {
    callback(this[i], i, this);
  }
};

[0,1,2,3].myEach(fake);





function doubler(value, ind, arr) {
  return (value*2);
}

Array.prototype.myMap = function (callback) {
  let res = [];
  for(let i=0; i < this.length; i++) {
    res.push( callback(this[i], i, this) );
  }
  return (res);
};
[1,2,3].myMap(doubler);





function injectCalee(accumulator, value, ind, arr) {
  return (value*2);
}

Array.prototype.myInject = function (callback, initial=undefined) {
  let startInd = 0;
  if (initial === undefined) {
    initial = callback(0, this[0], 0, this);
    startInd = 1;
  }

  let smallArr = this.slice(startInd, this.length);
  console.log(smallArr);
  smallArr.myEach((iVal, i, iArr) => {
    initial += callback(initial, iVal, i, iArr);
  });

  return (initial);
};

[1,2,3].myInject(injectCalee);
