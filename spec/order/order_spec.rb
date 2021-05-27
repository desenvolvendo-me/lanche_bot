# frozen_string_literal: true

require "lanche_bot/order/order"

RSpec.describe Order do
  context "Create" do
    before do
      @customer = Customer::Customer.new("Diego", 91_999_999)
      @restaurant = Restaurant::Restaurant.new("Lanches 1000", "Avenida da Paz - 15 - Santa Fé")
      @menu_main = Menu::MenuMain.new("Misto Quente", "Queijo e Presunto", 2.5)
      @menu_juice = Menu::MenuJuice.new("Laranja", "300 ml", 3.0)

      @order = Order::Order.new(@customer, @restaurant, [@menu_main, @menu_juice])

    end

    it "attributes" do
      expect(@order.customer.name).to eq("Diego")
      expect(@order.customer.phone).to eq(91_999_999)
      expect(@order.customer).to eq(@customer)

      expect(@order.restaurant.name).to eq("Lanches 1000")
      expect(@order.restaurant).to eq(@restaurant)

      expect(@order.items.first.name).to eq("Misto Quente")
      expect(@order.items.last.name).to eq("Laranja")
    end

  end
end
