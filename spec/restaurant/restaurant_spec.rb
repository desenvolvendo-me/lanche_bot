# frozen_string_literal: true

require "lanche_bot/restaurant/restaurant"

RSpec.describe "Lanchonete" do
  context "create" do
    before do
      @name = "Mané Simpatia"
      @address = "Rua do Divina Providência, nº 1234"
    end

    it "should return name" do
      restaurant = Restaurant::Restaurant.new(@name, @address).create

      expect(restaurant.name).to eq(@name)
      expect(restaurant.address).to eq(@address)
    end
  end
end
