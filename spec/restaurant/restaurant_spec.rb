# frozen_string_literal: true

RSpec.describe "Restaurant" do
  csv_path = "spec/fixtures/restaurant-test.csv"
  header = %w[id name address opening_time open]

  before do
    stub_const("Restaurant::Restaurant::DATA_PATH", csv_path)
  end

  before(:each) do
    restart_csv(csv_path, header)
    @name = "Godzilla"
    @address = "Rua do Divina Providência, nº 1234"
    @restaurant = Restaurant::Restaurant.new(@name, @address, id: "1").create
  end

  context "show" do
    let(:restaurants) { Restaurant::Restaurant.restaurants }

    it "check information first restaurant" do
      restaurant = restaurants.first

      expect(restaurant.name).to eq(@name)
      expect(restaurant.address).to eq(@address)
      expect(restaurant.open).to eq(false)
      expect(restaurant.opening_time).to eq("")
    end

    it "get restaurant with id = 1" do
      restaurant = Restaurant::Restaurant.find("1")

      expect(restaurant.name).to eq(@name)
    end
  end

  context "create" do
    it "should all attributes" do
      expect(@restaurant.name).to eq(@name)
      expect(@restaurant.address).to eq(@address)
      expect(@restaurant.open).to eq(false)
      expect(@restaurant.opening_time).to eq("")
    end
  end

  context "update is open" do
    it "change to open" do
      @restaurant.open!

      expect(@restaurant.open).to eq(true)
    end

    it "change to close" do
      @restaurant.close!

      expect(@restaurant.open).to eq(false)
    end
  end

  context "validate" do
    let(:restaurant) { Restaurant::Restaurant.new(name, address) }

    it "name" do
      error_name = Restaurant::Restaurant.new("", @address).create
      expect(error_name).to include("O Nome não pode ser vazio")
    end

    it "address" do
      error_address = Restaurant::Restaurant.new(@name, nil).create
      expect(error_address).to include("O Endereço não pode ser vazio")
    end
  end
end
