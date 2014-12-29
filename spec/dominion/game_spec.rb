require "spec_helper"

describe Game do
  describe "starting state" do
    before do
      @michael = Player.new("Michael")
      @katie = Player.new("Katie")
      @dan = Player.new("Dan")
      @players = [@michael, @katie, @dan]
      @game = Game.new(@players)
    end

    it "should give each player the correct number of cards" do
      @players.each do |player|
        expect(player.deck.count).to eq 5
        expect(player.hand.count).to eq 5
      end
    end

    it "should start the game with the correct number of cards" do
      expect(@game.coppers.count).to eq 39
      expect(@game.estates.count).to eq 15
    end
  end
end
