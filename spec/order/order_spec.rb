# frozen_string_literal: true

require "lanche_bot/order/order"

RSpec.describe Order do
  csv_path = "spec/fixtures/order-test.csv"
  header = %w[id customer_name order confirmed]

  before do
    stub_const("Order::Order::DATA_PATH", csv_path)
    stub_const("Restaurant::Restaurant::DATA_PATH", "spec/fixtures/restaurant-test.csv")
    stub_const("Customer::Customer::DATA_PATH", "spec/fixtures/customers-test.csv")
    Customer::Customer.new("Luciano", "992444444", id: "22").create
  end

  before(:each) do
    restart_csv(csv_path, header)
  end

  let(:customer) { Customer::Customer.find("22") }
  let(:restaurant) { Restaurant::Restaurant.new("Godzilla", "Rua do Divina Providência, nº 1234").create }
  let(:menu_main) { Menu::MenuMain.new("Misto Quente", "Queijo e Presunto", 2.5) }
  let(:menu_juice) { Menu::MenuJuice.new("Laranja", "300 ml", 3.0) }

  let!(:order_create) { Order::Order.new(customer, restaurant, [menu_main, menu_juice]).create }
  let!(:order_without_items) { Order::Order.new(customer, restaurant).create }

  context "Create" do
    it "attributes" do
      order = order_create[:order]

      expect(order.customer.name).to eq("Luciano")
      expect(order.customer.phone).to eq("992444444")
      expect(order.customer).to eq(customer)

      expect(order.restaurant.name).to eq("Godzilla")
      expect(order.restaurant).to eq(restaurant)

      expect(order.items.first.name).to eq("Misto Quente")
      expect(order.items.last.name).to eq("Laranja")
    end

    it "count orders by customers" do
      expect(Order::Order.count_orders_by_costumer("Luciano")).to eq(1)
    end

    it "order without items" do
      expect(order_without_items[:message]).to include("O pedido deve ter ao menos 1 item")
    end

    it "customer new return message" do
      expect(order_create[:message]).to include("Olá, aqui é da Lanchonete Godzilla")
    end
  end

  context "order confirm" do
    it "order not confirm default" do
      expect(order_create[:order].confirmed).to be_falsey
    end

    it "order confirmed" do
      order_create[:order].confirm_order

      expect(order_create[:order].confirmed).to be_truthy
    end

    it "return confirm message" do
      order_create[:order].confirm_order

      expect(order_create[:order].order_confirmed?).to eq("Seu Pedido Foi Confirmado!")
    end

  end
end
