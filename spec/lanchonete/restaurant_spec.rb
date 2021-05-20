# frozen_string_literal: true

require "rspec"
require "restaurant/restaurant"

RSpec.describe "Restaurant" do
  context "create" do
    before do
      @name = "Godzilla"
      @address = "Rua do Divina Providência, nº 1234"
    end

    it "should return name" do
      restaurant = Restaurant::Restaurant.new(@name, @address)

      expect(restaurant.name).to eq(@name)
      expect(restaurant.address).to eq(@address)
    end
  end
end
