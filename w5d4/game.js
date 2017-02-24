

class Game {

  constructor() {
    this.towers = [[3,2,1], [], []];
  }

  promptMove(reader, callback) {
    this.print();
    reader.question(
      "Enter in 'from, to' excluding quotes: ",
      (answer) => {
        let arr = answer.split(",");
        let from = parseInt(arr[0]);
        let to = parseInt(arr[1]);
        callback(from, to);
      });
  }

  isValidMove(from, to) {
    if (from < 0 || from > 2 || to < 0 || to > 2 || from === to ) {
      return false;
    }
    if (this.towers[from].length === 0 )return false;
    if (this.towers[to].length === 0) return true;
    let fromDisk = this.towers[from][(this.towers[from].length - 1)];
    let toDisk = this.towers[to][(this.towers[to].length - 1)];
    return (fromDisk < toDisk);
  }

  move(from, to) {
    if (this.isValidMove(from, to)) {
      this.towers[to].push(this.towers[from].pop());
      return true;
    }
    return false;
  }

  print() {
    console.log(this.towers);
    // JSON.stringify(this.towers);
  }

  isWon() {
    return (this.towers[0].length === 0 &&
      [this.towers[1].length, this.towers[2].length].includes(3) );
  }

  run(reader, completionCallback) {
    // promptMove from user
    console.log(reader.question);
    const destination = (from, to) => {
      if (this.move(from, to) === false) console.log("Invalid move!");
      if (this.isWon()) {
        // reader.close();
        console.log("Way to go champ!");
        this.print();
        console.log(completionCallback);
        completionCallback();
      } else {
        this.run(reader, completionCallback);
      }
    };
    this.promptMove(reader, destination);
  }
}

module.exports = Game;
