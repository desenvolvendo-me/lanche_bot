# frozen_string_literal: true

require "lanche_bot/order/order"

RSpec.describe Order do
  before do
    @customer = Customer::Customer.new("Diego", "991234568")
    @restaurant = Restaurant::Restaurant.new("Lanches 1000", "Avenida da Paz - 15 - Santa Fé")
    @item_main = Menu::MenuMain.new("Misto Quente", "Queijo e Presunto", 2.5)
    @item_juice = Menu::MenuMain.new("Laranja", "300 ml", 3.0)
  end

  it "Criar" do
    order = Order::Order.new(@customer, @restaurant)

    expect(order.customer.name).to eq("Diego")
    expect(order.restaurant.name).to eq("Lanches 1000")
    expect(order.customer).to eq(@customer)
    expect(order.restaurant).to eq(@restaurant)
  end

  it "Adicionar Items" do
    order = Order::Order.new(@customer, @restaurant)
    order.items = [@item_main, @item_juice]

    expect(order.items.first.name).to eq("Misto Quente")
    expect(order.items.first.price).to eq(2.5)
    expect(order.items.last.name).to eq("Laranja")
    expect(order.items.last.price).to eq(3.0)
    expect(order.items.size).to eq(2)
  end
end
