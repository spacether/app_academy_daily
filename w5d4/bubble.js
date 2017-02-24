const readline = require('readline');

const reader = readline.createInterface({
  // it's okay if this part is magic; it just says that we want to
  // 1. output the prompt to the standard output (console)
  // 2. read input from the standard input (again, console)

  input: process.stdin,
  output: process.stdout
});

const askIfGreaterThan = (el1, el2, callback) => {
  reader.question(`Is ${el1} > ${el2} ? (y/n) `, (answer) => {
    let bool = true;
    if (answer === 'n') {
      bool = false;
    }
    callback(bool);
  });
};

const innerBubbleSortLoop = (arr, i, madeAnySwaps, outerBulbbleSortLoop) => {
  if (i < arr.length - 1) {
    let el1 = arr[i];
    let el2 = arr[i + 1];
    let swapper = (bool) => {
      if (bool) {
        let tmp = arr[i];
        arr[i] = arr[i+1];
        arr[i+1] = tmp;
        madeAnySwaps = true;
      }
      innerBubbleSortLoop(arr, i+1, madeAnySwaps, outerBulbbleSortLoop);
    };
    askIfGreaterThan(el1, el2, swapper);
  } else {
    outerBulbbleSortLoop(madeAnySwaps);
  }
};
// innerBubbleSortLoop( [5,1,6], 0, false, console.log);


const absurdBubbleSort = (arr, sortCompletionCallback) => {
  const outerBulbbleSortLoop = (madeAnySwaps) => {
    if (madeAnySwaps) {
      innerBubbleSortLoop(arr, 0, false, outerBulbbleSortLoop);
    } else {
      sortCompletionCallback(arr);
      reader.close();
    }
  };
  outerBulbbleSortLoop(true);
};

absurdBubbleSort([5,11,1,6], console.log);
