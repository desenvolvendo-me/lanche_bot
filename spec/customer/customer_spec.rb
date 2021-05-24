# frozen_string_literal: true

require "lanche_bot/customer/customer"

RSpec.describe "customer" do
  it "criar" do
    customer = Customer::Customer.new("levi", "991234567")

    expect(customer.name).to eq("levi")
    expect(customer.phone).to eq("991234567")
  end
end
