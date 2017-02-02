require_relative 'card.rb'

class Deck

  def self.make_cards
    res = []
    suits = %i(clubs spades hearts diamonds)
    values = %w(ace 2 3 4 5 6 7 8 9 10 jack queen king)
    suits.each do |suit|
      values.each { |value| res << Card.new(value, suit) }
    end
    res
  end

  def initialize
    @cards = self.class.make_cards
  end

  def cards
    @cards.dup
  end

  def length
    @cards.length
  end

  def empty?
    @cards.empty?
  end

  def shuffle!
    @cards.shuffle!
    @cards.dup
  end

  def deal(n)
    res = []
    n.times { res << @cards.pop }
    res
  end

end

# deck = Deck.new
#
# deck.cards.each {|c| puts c}
# puts deck.cards.uniq.length
