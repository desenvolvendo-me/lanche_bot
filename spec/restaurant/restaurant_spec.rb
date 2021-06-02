# frozen_string_literal: true

RSpec.describe "Restaurant" do
  let(:name) { "Godzilla" }
  let(:address) { "Rua do Divina Providência, nº 1234" }

  context "show" do
    let(:restaurants) { Restaurant::Restaurant.restaurants }

    it "check information first restaurant" do
      restaurant = restaurants.first

      expect(restaurant.name).to eq("Godzilla")
      expect(restaurant.address).to eq("Rua do Divina Providência, nº 1234")
      expect(restaurant.open).to eq(true)
    end
  end

  context "create" do
    it "should all attributes" do
      restaurant = Restaurant::Restaurant.new(name, address).create

      expect(restaurant.name).to eq(name)
      expect(restaurant.address).to eq(address)
      expect(restaurant.open).to eq(false)
    end
  end

  context "update is open" do
    let(:restaurant) { Restaurant::Restaurant.new(name, address) }

    it "change to open" do
      restaurant.open!

      expect(restaurant.open).to eq(true)
    end

    it "change to close" do
      restaurant.close!

      expect(restaurant.open).to eq(false)
    end
  end
end
