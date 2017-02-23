Array.prototype.uniq = function() {
  let res = [];
  for(let i=0; i < this.length; i++) {
    let value = this[i];
    if (!res.includes(value)) res.push(value);
  }
  return res;
};
console.log([1,2,2,1,1,3].uniq());

function twoSum(arr) {
  let res = [];
  const getIndices = (val, index, array) => {
    for(let i=index+1; i < array.length; i++) {
      if (val + array[i] === 0) res.push([index, i]);
    }
  };
  arr.forEach(getIndices);
  return(res);
}
twoSum([1,2,3,-1,-1,-3]);

Array.prototype.transpose = function() {
  // console.log(this);
  if (this.length === 0 ||
     (this.length === 1 && this[0].length === undefined)) {
    return (this);
  }
  let res = [];
  for(let i=0; i < this[0].length; i++) {
    let row = [];
    for(let j = 0; j < this.length; j++) {
      row.push(this[j][i]);
    }
    res.push(row);
  }
  return (res);
};

console.log( [0].transpose() );
console.log( [[0,1],[2,3],[4,5]].transpose() );
