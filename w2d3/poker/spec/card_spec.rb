require 'card.rb'

describe 'Card#initialize' do
  subject(:card) { Card.new('2', :diamonds) }

  it "checks if card value is correctly assigned" do
    expect(card.value).to eq('2')
  end

  it "check if the suit is correctly assigned" do
    expect(card.suit).to eq(:diamonds)
  end

  it "returns the correct string representation of the cards" do
    expect(card.to_s).to eq("2♦")
  end

end
