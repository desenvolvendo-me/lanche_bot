# frozen_string_literal: true

RSpec.describe "Restaurant" do
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
