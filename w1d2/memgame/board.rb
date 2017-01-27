require_relative 'card'

class Board
  attr_reader :size

  def initialize
    @size = 4
    @grid = Array.new(@size) { Array.new(@size) }
    populate
  end

  def populate
    cards = (0...@size**2).map { |i| Card.new(i%(@size*@size/2)) }.shuffle
    (0...@size).each do |x|
      (0...@size).each { |y| self[[x, y]] = cards.pop }
    end
  end

  def render
    system("clear")
    @grid.each do |row|
      puts row.map(&:display).join(" ")
    end
  end

  def won?
    @grid.flatten.all?(&:face_up)
  end

  def reveal(pos)
    self[pos].reveal
  end

  def [](pos)
    x, y = pos
    @grid[x][y]
  end

  def []=(pos, val)
    x, y = pos
    @grid[x][y] = val
  end

end
