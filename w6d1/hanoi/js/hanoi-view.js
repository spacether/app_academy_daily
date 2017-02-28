class View {
  constructor(game, $el) {
    this.game = game;
    this.$el = $el;
    this.setupTowers();
    this.render();
    this.selected = [];
  }

  setupTowers() {
    let tower = '<ul><li></li><li></li><li></li></ul>';
    for (let i = 0; i < 3; i++) {
      let $tower = $(tower);
      this.$el.append($tower);
      $tower.on("click", event => { this.clickTower(i); });
    }
  }

  clickTower(tower){
    $('figcaption').text("");
    $('ul').eq(tower).addClass("selected");
    this.selected.push(tower);
    if (this.selected.length === 2) {
      let moved = this.game.move(...this.selected);
      if (moved) {
        this.render();
        if (this.game.isWon()) {
          $('figcaption').text("You WON!");
        }
      } else {
        $('figcaption').text("Invalid Move!");
      }
      this.selected = [];
      $('ul').removeClass('selected');
    }
  }

  resetGame() {
    $('figcaption').text("");
    this.game.towers = [[3, 2, 1], [], []];
    this.render();
  }

  render() {
    let hash = {1: 'small', 2: 'med', 3: 'large'};
    let $uls = $("ul");
    for (let i = 0; i < this.game.towers.length; i++) {
      let tower = this.game.towers[i];
      for (let j = 0; j < 3; j++) {
        if (j < tower.length) {
          let discSize = tower[j];
          let classString = hash[discSize];
          $uls.eq(i).children().eq(2 - j).addClass(classString);
        } else {
          $uls.eq(i).children().eq(2 - j).removeClass("small med large");
        }
      }
    }
  }
}

module.exports = View;
