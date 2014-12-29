module Dominion
  class Turn
    def initialize(player)
      @player = player
      @buys = 1
    end

    def play
      puts @player.hand.to_s(true)
      action_phase
      buy_phase
      cleanup_phase
    end

    def action_phase
      puts Crayon.red("Action Phase")
    end

    def buy_phase
      @available_treasure = @player.hand.available_treasure
      puts Crayon.red("Buy Phase: ").yellow(@available_treasure)
      while @buys > 0
        cards = affordable_cards
        cards.each_with_index do |card, index|
          color = case card.first.supertype
                  when "Victory" then :green
                  when "Treasure" then :yellow
                  end
          puts Crayon.send(color, "(#{index}) #{card.first.type}")
        end
        puts "Buy a card: "
        card_number = STDIN.gets.chomp
        if card_number == "skip"
          puts "skipping buy phase"
        else
          card = cards[card_number.to_i].shift
          @player.table << card
          @available_treasure -= card.cost
        end
        @buys -= 1
      end
    end

    def affordable_cards
      cards = @player.game.buyable_cards.select do |card|
        !card.empty? && (card.first.cost <= @available_treasure)
      end
    end

    def cleanup_phase
      puts Crayon.red("Cleanup Phase")
      while !@player.hand.empty?
        @player.table << @player.hand.shift
      end
      while !@player.table.empty?
        @player.discard << @player.table.shift
      end
      @player.draw_hand
    end
  end
end
