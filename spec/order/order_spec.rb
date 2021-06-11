# frozen_string_literal: true

require "lanche_bot/order/order"

RSpec.describe Order do
  csv_path = "spec/fixtures/order-test.csv"
  header = %w[id customer_name customer_phone order confirmed canceled canceled_by]

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
  let(:menu_main) { Menu::MenuMain.new({ name: "Misto Quente", description: "Queijo e Presunto", price: 2.5 }) }
  let(:menu_juice) { Menu::MenuJuice.new("Laranja", "300 ml", 3.0) }

  let!(:order_create) do
    Order::Order.new({ customer: customer, restaurant: restaurant, items: [menu_main, menu_juice] }).create
  end

  let!(:order_without_items) { Order::Order.new({ customer: customer, restaurant: restaurant }).create }

  let(:order) { order_create[:order] }

  describe "Create" do
    let(:order) { order_create[:order] }
    context "attributes" do
      it "customer" do
        customer = order.customer

        expect(customer.name).to eq("Luciano")
        expect(customer.phone).to eq("992444444")
      end

      it "restaurant" do
        expect(order.restaurant.name).to eq("Godzilla")
      end

      it "items" do
        items = order.items

        expect(items.first.name).to eq("Misto Quente")
        expect(items.last.name).to eq("Laranja")
      end

      it "status default" do
        expect(order.status).to eq("Esperando confirmação")
      end
    end

    it "count orders by customers" do
      expect(Order::Order.count_orders_by_costumer("992444444")).to eq(1)
    end

    it "order without items and price total nil" do
      expect(order_without_items[:message]).to include("O pedido deve ter ao menos 1 item")
      expect(order_without_items[:total_price]).to be_nil
    end

    it "customer new return message" do
      expect(order_create[:message]).to include("Olá, aqui é da Lanchonete Godzilla")
    end

    it "order return total price" do
      expect(order_create[:total_price]).to eq(5.5)
    end
  end

  context "order confirm" do
    it "order not confirm default" do
      expect(order.confirmed).to be_falsey
    end

    it "order confirmed" do
      order.confirm_order

      expect(order.confirmed).to be_truthy
    end

    it "return confirm message" do
      order.confirm_order
      expect(order.order_confirmed?).to eq("Seu Pedido Foi Confirmado!")
    end
  end

  context "order cancel" do
    it "order not cancel default" do
      expect(order.canceled).to be_falsey
    end

    it "order canceled" do
      order.cancel_order("Customer")
      expect(order.canceled).to be_truthy
    end

    it "return cancel message by Customer" do
      order.cancel_order("Customer")
      expect(order.order_canceled?).to eq("Seu Pedido Foi Cancelado por Luciano!")
    end

    it "return cancel message by Restaurant" do
      order.cancel_order("Restaurant")
      expect(order.order_canceled?).to eq("Seu Pedido Foi Cancelado por Godzilla!")
      expect(order.status).to eq("Cancelado")
    end
  end

  describe "Change status to next" do
    it "status default" do
      expect(order.status).to eq("Esperando confirmação")
    end

    it "Esperando confirmação => Confirmado" do
      order.status = "Esperando confirmação"

      order.change_status
      expect(order.status).to eq("Confirmado")
    end

    it "Confirmado => Em espera para preparação" do
      order.status = "Confirmado"

      order.change_status
      expect(order.status).to eq("Em espera para preparação")
    end

    it "Em espera para preparação => Em preparação" do
      order.status = "Em espera para preparação"

      order.change_status
      expect(order.status).to eq("Em preparação")
    end

    it "Em preparação => Pronto para entrega" do
      order.status = "Em preparação"

      order.change_status
      expect(order.status).to eq("Pronto para entrega")
    end

    it "Pronto para entrega => Saiu para entregar" do
      order.status = "Pronto para entrega"

      order.change_status
      expect(order.status).to eq("Saiu para entregar")
    end

    it "Saiu para entregar => Entregue" do
      order.status = "Saiu para entregar"

      order.change_status
      expect(order.status).to eq("Entregue")
    end

    it "Entregue => Cancelado / not change" do
      order.status = "Entregue"

      order.change_status
      expect(order.status).to eq("Entregue")
    end
  end
end
