class Towers
  attr_reader :towers

  def initialize
    @towers = [[3, 2, 1], [], []]
  end

  def move(from, to)
    raise ArgumentError if [from, to].any? { |i| !i.between?(0, 2) }
    if !@towers[from].empty? && !@towers[to].empty?
      raise StandardError if @towers[from].last > @towers[to].last
    end
    item = @towers[from].pop
    @towers[to] << item
  end

  def won?
   return true if @towers[1..-1].any? { |tower| tower == [3, 2, 1] }
   false
  end

end
