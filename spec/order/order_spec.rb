# frozen_string_literal: true

require "lanche_bot/order/order"

RSpec.describe Order do
  context "Create" do
    before do
      @customer = Customer::Customer.new("Diego", 91999999)
      @restaurant = Restaurant::Restaurant.new("Lanches 1000", "Avenida da Paz - 15 - Santa Fé")
      @order = Order::Order.new(@customer, @restaurant)
    end
    it "attributes" do
      expect(@order.customer.name).to eq("Diego")
      expect(@order.customer.phone).to eq(91999999)
      expect(@order.restaurant.name).to eq("Lanches 1000")
      expect(@order.customer).to eq(@customer)
      expect(@order.restaurant).to eq(@restaurant)
    end
  end

end
