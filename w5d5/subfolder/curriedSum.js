function curriedSum(numArgs) {
  let numbers = [];
  function _curriedSum(number) {
    numbers.push(number);
    if(numbers.length === numArgs) {
      return numbers.reduce( (acc, num) => acc + num, 0 );
    } else {
      return _curriedSum;
    }
  }
  return _curriedSum;
}

const sum = curriedSum(4);
console.log(sum(5)(30)(20)(1)); // => 56



Function.prototype.curry = function (numArgs) {
  let args = [];
  const anon = (arg) => {
    args.push(arg);
    if(args.length === numArgs) {
      return this(...args);
    } else {
      return anon;
    }
  };
  return anon;
};

function sumThree(num1, num2, num3) {
  return num1 + num2 + num3;
}

console.log(sumThree(4, 20, 6)); // == 30

// you'll write `Function#curry`!
let f1 = sumThree.curry(3); // tells `f1` to wait until 3 args given
f1 = f1(4); // [Function]
f1 = f1(20); // [Function]
f1 = f1(6); // = 30

// or more briefly:
console.log(sumThree.curry(3)(4)(20)(6)); // == 30
