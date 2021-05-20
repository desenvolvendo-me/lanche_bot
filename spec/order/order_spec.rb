# frozen_string_literal: true

require "lanche_bot/order/order"

RSpec.describe Order do
  it "Criar" do
    customer = Customer::Customer.new("Diego")
    lanchonete = Lanchonete::Lanchonete.new("Lanches 1000", "Avenida da Paz - 15 - Santa Fé")
    order = Order::Order.new(customer, lanchonete)

    expect(order.customer.name).to eq("Diego")
    expect(order.lanchonete.name).to eq("Lanches 1000")
    expect(order.customer).to eq(customer)
    expect(order.lanchonete).to eq(lanchonete)
  end
end
