const Game = require("./game");

const readline = require('readline');
const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});


function playagain() {
  reader.question( "Wanna play again? (y/n) ", (answer) => {
    if (answer === "y") {
      new Game().run(reader, playagain);
    } else {
      console.log("Goodbye");
      reader.close();
    }
  });
}

console.log(reader.question);
new Game().run(reader, playagain);
