module Dominion
  class Player
    attr_reader :name, :deck, :discard, :hand, :game, :table

    def initialize(name)
      @name = name
      @hand = CardPile.new
      @table = CardPile.new
      @discard = CardPile.new
    end

    def score
      @deck.victory_cards.map(&:value).inject(0) { |t, n| t + n }
    end

    def take_turn
      Turn.new(self).play
    end

    def set_starting_deck(game)
      @game = game
      @deck = CardPile.new
      7.times { @deck << game.coppers.shift }
      3.times { @deck << game.estates.shift }
      @deck.shuffle!
      draw_hand
    end

    def draw_hand
      5.times do
        if @deck.empty?
          reshuffle_discard_into_deck
        end
        @hand << @deck.shift
      end
    end

    def reshuffle_discard_into_deck
      while !@discard.empty?
        @deck << @discard.shift
      end
      @deck.shuffle!
    end

    def combine_hand_with_deck
      while !@hand.empty?
        @deck << @hand.shift
      end
    end
  end
end
