require "spec_helper"

describe Card do
  describe "behaves like an abstract class" do
    Card::CARD_METHODS.each do |method|
      it "should raise NotImplementedError for #{method} on the class" do
        expect {
          Card.send(method)
        }.to raise_error "You must implement .#{method} for Dominion::Card"
      end

      it "should raise NotImplementedError for #{method} on an instance" do
        expect {
          Card.new.send(method)
        }.to raise_error "You must implement ##{method} for Dominion::Card"
      end
    end
  end
end
