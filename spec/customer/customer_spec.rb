# frozen_string_literal: true

require "lanche_bot/customer/customer"

RSpec.describe "customer" do
  it "criar" do
    name = "Luciano"
    phone = "18999999"
    customer = Customer::Customer.new(name, phone).create

    expect(customer.name).to eq(name)
    expect(customer.phone).to eq(phone)
    expect(customer.id).to be_truthy
  end

  it "get custormer with id = 3" do
    customer = Customer::Customer.find("3")

    expect(customer["name"]).to eq("Marcos")
  end
end
