class Card
  VALUES = {
    'ace' => "A",
    '2' => "2",
    '3' => "3",
    '4' => "4",
    '5' => "5",
    '6' => "6",
    '7' => "7",
    '8' => "8",
    '9' => "9",
    '10' => "10",
    'jack' => "J",
    'queen' => "Q",
    'king' => "K"
  }

  %w(a 2 3 4 5 6 7 8 9 10 )

  SUIT = {
    diamonds: "♦",
    hearts: "♥",
    clubs: "♣",
    spades: "♠" }

  attr_reader :value, :suit

  def initialize(value, suit)
    @value, @suit = value, suit
  end

  def to_s
    VALUES[@value] + SUIT[@suit]
  end

  def eql?(other_card)
    self.to_s == other_card.to_s
  end

  def hash
    to_s.hash
  end

end
