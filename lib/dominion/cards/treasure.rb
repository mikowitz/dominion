module Dominion
  class Treasure < Card
    class << self
      def cost(cost)
        @cost = cost
      end

      def value(value)
        @value = value
      end
    end

    def cost
      self.class.instance_variable_get("@cost")
    end

    def value
      self.class.instance_variable_get("@value")
    end

    def ability
      raise TypeError.new("Do not call #ability on treasure cards")
    end
  end
end
