require "spec_helper"

describe CardPile do
  describe "initialize" do
    describe "with a specified card type" do
      it "should create a pile with the specified number of cards" do
        pile = CardPile.new(Copper, 15)
        expect(pile.count).to eq 15
        expect(pile.all?{|card| card.is_a?(Copper)}).to be true
      end

      it "should create a pile with 10 cards if no number is specified" do
        pile = CardPile.new(Copper)
        expect(pile.count).to eq 10
        expect(pile.all?{|card| card.is_a?(Copper)}).to be true
      end

      it "should create an empty pile if no arguments are given" do
        pile = CardPile.new
        expect(pile).to be_empty
      end
    end
  end
end
