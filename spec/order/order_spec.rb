# frozen_string_literal: true

require "lanche_bot/order/order"

RSpec.describe Order do
  it "Criar" do
    customer = Customer::Customer.new("Diego", "991234568")
    restaurant = Restaurant::Restaurant.new("Lanches 1000", "Avenida da Paz - 15 - Santa Fé")
    order = Order::Order.new(customer, restaurant)

    expect(order.customer.name).to eq("Diego")
    expect(order.restaurant.name).to eq("Lanches 1000")
    expect(order.customer).to eq(customer)
    expect(order.restaurant).to eq(restaurant)
  end
end
