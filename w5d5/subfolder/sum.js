const sum = function() {
  let res = 0;
  for(let i=0; i < arguments.length; i++){
    res += arguments[i];
  }
  return (res);
};

console.log(sum(1,2,3,4));


const sum2 = function(...arr) {
  let res = 0;
  for(let i=0; i < arr.length; i++){
    res += arr[i];
  }
  return (res);
};
console.log(sum2(1,2,3,4));
