require 'towers.rb'


describe Towers do
  let(:win_stack) {[3, 2, 1]}
  subject(:game) { Towers.new }

  context '#initialize' do
    it "Initializes the game with 3 disks in the first tower" do
      expect(game.towers.first).to eq(win_stack)
    end
    it "Sets second and third towers to empty" do
      expect(game.towers[1..-1]).to eq([[], []])
    end
  end

  context '#move(from_pos, to_pos)' do

    it "raises an error if the indices are out of bounds" do
      expect { game.move(-1,0) }.to raise_error(ArgumentError)
      expect { game.move(0,3) }.to raise_error(ArgumentError)
    end

    it "does not place a larger disc on top of a smaller one" do
      game.move(0, 1)
      game.move(0, 2)
      expect {game.move(0,1)}.to raise_error(StandardError)
    end

    it "updates the towers if it is a valid move" do
      expect(game.towers).to eq([win_stack, [], []])
      game.move(0, 1)
      expect(game.towers).to eq([[3,2], [1], []])
    end

  end

  context "Won" do
    it "it returns true if the game is won" do
      game.towers[0] = []
      game.towers[1] = win_stack
      game.towers[2] = []
      expect(game.won?).to eq(true)
      game.towers[0] = []
      game.towers[1] = []
      game.towers[2] = win_stack
      expect(game.won?).to eq(true)
    end

    it "after initialization, returns false if the game is not won" do
      expect(game.won?).to eq(false)
    end

    it "after a valid move, returns false if the game is not won" do
      game.move(0, 1)
      expect(game.won?).to eq(false)
    end

  end
end
