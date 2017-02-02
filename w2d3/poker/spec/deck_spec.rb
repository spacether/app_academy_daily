require 'deck.rb'

describe 'Deck' do
  subject(:deck) { Deck.new }
  context '#initialize' do

    it "generates 52 cards" do
      expect(deck.length).to eq(52)
    end

    it "creates 13 cards of each suit" do
      clubs = deck.cards.select { |card| card.suit == :clubs }
      spades = deck.cards.select { |card| card.suit == :spades }
      hearts = deck.cards.select { |card| card.suit == :hearts }
      diamonds = deck.cards.select { |card| card.suit == :diamonds }
      suits = [clubs, spades, hearts, diamonds]
      bool = suits.all? {|suit| suit.length == 13 }
      expect(bool).to eq(true)
    end

    it "every card is unique" do
      expect(deck.cards.uniq.length == 52).to eq(true)
    end
  end

  context '#shuffle' do
    it "shuffles the deck" do
      before_shuffled = deck.cards
      expect(deck.shuffle!).to_not eq(before_shuffled)
    end
  end

  context '#deal' do
    it "removes N cards from the deck" do
      expect(deck.length).to eq(52)
      dealt_cards = deck.deal(5)
      expect(dealt_cards.length).to eq(5)
      expect(deck.length).to eq(47)
    end

    # did not throw error when no more cards left to deal

  end

  # did not test empty


end
# deck = Deck.new
# deck.container
