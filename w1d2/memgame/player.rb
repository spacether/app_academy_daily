require 'byebug'

class HumanPlayer
  attr_reader :name

  def initialize(name, size)
    @name = name
    @size = size
  end

  def get_input(_turn)
    puts 'Enter in a location x, y'
    gets.chomp.split(',').map(&:to_i)
  end

  def receive_loc_val(_loc, _val)
  end

end

class ComputerPlayer
  attr_reader :name, :loc_by_val, :unguessed

  def initialize(name, size)
    @name = name
    @size = size
    @loc_by_val = Hash.new { |h, k| h[k] = [] }
    @unguessed = []
    (0...@size).each { |x| (0...@size).each { |y| @unguessed << [x, y] } }
    @unguessed.shuffle!
  end

  def get_input(turn)
    debugger
    pairs = @loc_by_val.select { |k, v| v.length == 2 }
    # guess random if have one match or no matches
    # puts "Pairs are:"
    # p pairs
    # puts "Unguessed is:"
    # p @unguessed
    # puts "Loc By Val is:"
    # puts @loc_by_val
    return @unguessed.pop if pairs.empty?
    # make sure that pair is not face up
    # pick pair if have it
    cardval, locs = pairs.first
    pos = locs[turn]
    if turn == 1
      @loc_by_val.delete(cardval)
    end
    pos

  end

  def receive_loc_val(loc, val)
    # debugger
    unless @loc_by_val[val].include?(loc)
      @loc_by_val[val] << loc
    end

  end

end
