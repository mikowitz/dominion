module Dominion
  class Victory < Card
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
      raise TypeError.new("Do not call #ability on victory cards")
    end
  end
end
