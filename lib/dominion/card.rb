module Dominion
  class Card
    CARD_METHODS = [:ability, :cost, :value]

    class << self
      CARD_METHODS.each do |method|
        define_method(method) do
          raise NotImplementedError.new("You must implement .#{method} for #{self.name}")
        end
      end
    end

    CARD_METHODS.each do |method|
      define_method(method) do
        raise NotImplementedError.new("You must implement ##{method} for #{self.class.name}")
      end
    end

    def type
      self.class.name.split("::").last
    end

    def supertype
      self.class.superclass.name.split("::").last
    end
  end
end
