module Dominion
  class Game
    attr_reader :coppers, :silvers, :golds, :estates, :duchies, :provinces, :buyable_cards
    def initialize(players=[])
      @players = players
      setup
      @players.each do |player|
        player.set_starting_deck(self)
      end
    end

    def setup
      @coppers = CardPile.new(Copper, 60)
      @silvers = CardPile.new(Silver, 40)
      @golds = CardPile.new(Gold, 30)
      @estates = CardPile.new(Estate, 24)
      @duchies = CardPile.new(Duchy, 12)
      @provinces = CardPile.new(Province, 12)
      @buyable_cards = [@coppers, @silvers, @golds, @estates, @duchies, @provinces]
      @turn_number = 0
    end

    def game_over?
      @provinces.empty?
    end

    def play
      while !game_over?
        @turn_number += 1
        puts Crayon.green "===== Turn #{@turn_number} ====="
        puts Crayon.blue_on_white("Provinces: #{@provinces.count}".ljust(20))

        @players.each do |player|
          puts Crayon.yellow player.name
          player.take_turn
        end
      end

      puts Crayon.green("GAME OVER!")
      @players.each do |player|
        player.reshuffle_discard_into_deck
        player.combine_hand_with_deck
        #puts "#{player.name}: #{player.deck.map(&:type).join(", ")}"
        puts "#{player.name}: #{player.score}"
      end
    end
  end
end
