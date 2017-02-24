const readline = require('readline');

const reader = readline.createInterface({
  // it's okay if this part is magic; it just says that we want to
  // 1. output the prompt to the standard output (console)
  // 2. read input from the standard input (again, console)

  input: process.stdin,
  output: process.stdout
});


const addNumbers = (sum, numsLeft, completionCallback) => {
  if (numsLeft > 0) {
    reader.question("Give me a number: ", (answer) => {
      sum += parseInt(answer);
      numsLeft--;
      console.log(`Sum is: ${sum}`);
      addNumbers(sum, numsLeft, completionCallback);
    });
  } else {
    reader.close();
    completionCallback(sum);
  }
};

addNumbers(0, 3, sum => console.log(`Total Sum: ${sum}`));
