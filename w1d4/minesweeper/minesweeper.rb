require "byebug"

class Board

  def self.new_board(size)
    Array.new(size) { Array.new(size) { Tile.new } }
  end

  def initialize(size=9, bombs=9)
    @board = self.class.new_board(size)
    @bomb_locs = lay_bombs(bombs)

    # fix neighbors
  end

  def []=(pos, val)
    x, y = pos
    @board[x][y] = val
  end

  def [](pos)
    x, y = pos
    good_loc = pos.all? { |n| n.between?(0,@board.size-1)}
    good_loc ? @board[x][y] : nil
  end

  def lay_bombs(bombs)
    bomb_locs = []
    until bombs.zero?
      x = (0...@board.size).to_a.sample
      y = (0...@board.size).to_a.sample
      pos = [x, y]
      if self[pos].value > -1
        self[pos].value = -1
        bomb_locs << pos
        bombs -= 1
      end
    end
    setup_neighbors(bomb_locs)
  end

  def setup_neighbors(bomb_locs)
    bomb_locs.each do |loc|
      ntiles = get_neighbors(loc)
      ntiles.each { |tile| tile.value += 1 }
    end
  end

  def get_neighbors(loc)
    x, y = loc
    locs = [[x-1, y-1],[x-1, y],[x-1,y+1],[x,y-1], [x,y+1]]
    locs.concat([[x+1, y-1],[x+1, y],[x+1,y+1]])
    tiles = locs.map { |pos| self[pos] }.compact
    no_bomb_tiles = tiles.map { |tile| tile.value == -1 ? nil : tile}
      .compact
  end

  def display
    @board.each do |tiles|
      strline = tiles.map do |tile|
        tile.value == -1 ? "X" : tile.value
      end.join(" ")
      puts strline
    end
  end

end

class Tile
  attr_accessor :value, :visible

  def initialize
    @value = 0
    @visible = false
  end

end

b = Board.new
b.display
