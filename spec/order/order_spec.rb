# frozen_string_literal: true

require "lanche_bot/order/order"

RSpec.describe Order do
  context "Create" do
    before do
      @customer = Customer::Customer.find("1")
      @restaurant = Restaurant::Restaurant.find("883")
      @menu_main = Menu::MenuMain.new("Misto Quente", "Queijo e Presunto", 2.5)
      @menu_juice = Menu::MenuJuice.new("Laranja", "300 ml", 3.0)

      @order = Order::Order.new(@customer, @restaurant, [@menu_main, @menu_juice])
    end

    it "attributes" do
      expect(@order.customer["name"]).to eq("Levi")
      expect(@order.customer["phone"]).to eq("992444444")
      expect(@order.customer).to eq(@customer)

      expect(@order.restaurant["name"]).to eq("Godzilla")
      expect(@order.restaurant).to eq(@restaurant)

      expect(@order.items.first.name).to eq("Misto Quente")
      expect(@order.items.last.name).to eq("Laranja")
    end
  end
end
