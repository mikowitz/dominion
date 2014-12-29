require "spec_helper"

class Estate < Victory
  cost 2
  value 1
end

describe Victory do
  subject(:card) { Estate.new }

  describe "built with the DSL" do
    it "should return the correct value for the cost" do
      2
    end

    it "should return the correct value for value" do
      1
    end

    it "should return the correct value for type" do
      expect(card.type).to eq "Estate"
    end

    it "should raise an error for ability" do
      expect {
        card.ability
      }.to raise_error "Do not call #ability on victory cards"
    end
  end
end
