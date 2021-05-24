# frozen_string_literal: true

require "lanche_bot/order/order"

RSpec.describe Order do
  context "Create" do
    before do
      @customer = Customer::Customer.new("Diego")
      @restaurant = Restaurant::Restaurant.new("Lanches 1000", "Avenida da Paz - 15 - Santa Fé")
      @order = Order::Order.new(@customer, @restaurant)
    end
    it "attributes" do
      expect(@order.customer.name).to eq("Diego")
      expect(@order.restaurant.name).to eq("Lanches 1000")
      expect(@order.customer).to eq(@customer)
      expect(@order.restaurant).to eq(@restaurant)
    end
  end
  context "Count" do
    before do
      @customer_1 = Customer::Customer.new("Diego")
      @customer_2 = Customer::Customer.new("Diego Marujo")
      @restaurant = Restaurant::Restaurant.new("Lanches 1000", "Avenida da Paz - 15 - Santa Fé")
      @order = Order::Order.new(@customer_1, @restaurant)
    end

    it '1' do
      expect(@order.count).to eq(1)
    end

    it 'by client' do
      expect(@order.customer.count)
    end
  end

end
