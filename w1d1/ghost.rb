require 'byebug'

class Ghost
  def initialize(*players)
    @fragment = ""
    @players = players
    @dictionary = File.readlines("dictionary.txt").map(&:chomp)
    @losses = Hash.new(0)
    @round = 1
  end

  GHOST = "GHOST"
  def record(player)
    idx = @losses[player]
    return GHOST[0...idx]
  end

  def display_standings
    @players.each do |person|
      puts "Name: #{person.name} Score:#{record(person)}"
    end
  end

  def run
    #game over if players record is ghost.
    puts "Welcome to GHOST!"
    until @players.length == 1
      until over?
        puts "Round: #{@round}"
        play_round
        @round += 1
      end
      puts "#{previous_player.name} lost and is removed!"
      @players.delete(previous_player)
      display_standings
    end
    puts "You're a winner, #{@players.first.name}!"
  end

  def over?
    @players.any? {|person| record(person) == "GH"}
  end

  def play_round
    until @dictionary.include?(@fragment)
      take_turn
    end
    @losses[previous_player] += 1
    @fragment = ""
    display_standings
  end

  def current_player
    @players.first
  end

  def previous_player
    @players.last
  end

  def next_player!
    @players.rotate!
    current_player
  end

  def take_turn
    guess = ""
    while true
      guess = current_player.guess
      if valid_play?(guess)
        break
      else
        current_player.alert_invalid_guess
      end
    end
    @fragment += guess
    puts "Current fragment is: #{@fragment}"
    next_player!
  end

  def valid_play?(string)
    valid = ("a".."z").include?(string)
    word = @fragment + string
    indict = @dictionary.any? { |w| w.index(word) == 0 }
    valid && indict
  end

end


class Player
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def guess
    print "#{@name}, enter a letter:"
    gets.chomp
  end

  def alert_invalid_guess
    puts "That guess is not valid!"
  end

end

p1 = Player.new("Justin")
p2 = Player.new("Andrea")
p3 = Player.new("Xeno")
g = Ghost.new(p1, p2, p3)
g.run
