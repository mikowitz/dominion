require "spec_helper"

describe Treasure do
  subject(:card) { Silver.new }

  describe "built with the DSL" do
    it "should return the correct value for cost" do
      expect(card.cost).to eq 3
    end

    it "should return the correct value for value" do
      expect(card.value).to eq 2
    end

    it "should return the correct value for type" do
      expect(card.type).to eq "Silver"
    end

    it "should raise an error for ability" do
      expect {
        card.ability
      }.to raise_error "Do not call #ability on treasure cards"
    end
  end
end
