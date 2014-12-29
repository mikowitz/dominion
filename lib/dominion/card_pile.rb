module Dominion
  class CardPile < Array
    def initialize(card_type=nil, count=10)
      if card_type.nil?
        super()
      else
        super(count) { card_type.new }
      end
    end

    def available_treasure
      select { |card| card.supertype == "Treasure" }.map(&:value).inject(0) { |t, n| t + n }
    end

    def victory_cards
      select { |card| card.supertype == "Victory" }
    end

    def to_s(colored=false)
      if colored
        map do |card|
          case card.supertype
          when "Victory" then Crayon.green(card.type)
          when "Treasure" then Crayon.yellow(card.type)
          else Crayon.blue(card.type)
          end
        end.join(", ")
      else
        map(&:type).join(", ")
      end
    end
  end
end
