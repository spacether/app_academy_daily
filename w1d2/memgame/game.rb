require_relative 'board'
require_relative 'player'

class Game

  def initialize
    @board = Board.new
    @player = ComputerPlayer.new('hi', @board.size)
  end

  def over?
    @board.won?
  end

  def play
    play_turn until over?
    puts "Game over! You WON!"
  end

  def valid_pos?(pos)
    return false unless pos.all? { |n| n.between?(0, @board.size - 1) }
    !@board[pos].face_up
  end

  def play_turn
    @board.render
    cards = []
    2.times do |i|
      pos = get_pos(i)
      @player.receive_loc_val(pos, @board[pos].value)
      @board.reveal(pos)
      cards << @board[pos]
      @board.render
    end
    sleep(2) if @player.is_a?(HumanPlayer)
    cards.each(&:hide) unless cards.first == cards.last
    @board.render
  end

  def get_pos(turn)
    pos = [-1, -1]
    pos = @player.get_input(turn)

    # TODO: Reimplement for human
    # until valid_pos?(pos)
       pos = @player.get_input(turn)
    # end

    pos
  end
end
