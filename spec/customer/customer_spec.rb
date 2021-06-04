# frozen_string_literal: true

RSpec.describe "customer" do
  let(:name) { "Luciano" }
  let(:phone) { "18999999" }

  it "criar" do
    customer = Customer::Customer.new(name, phone).create

    expect(customer.name).to eq(name)
    expect(customer.phone).to eq(phone)
    expect(customer.id).to be_truthy
  end

  it "get customer with id = 3" do
    customer = Customer::Customer.find("3")

    expect(customer["name"]).to eq("Marcos")
  end

  context "validate" do
    it "name is required" do
      customer = Customer::Customer.new("", phone).create

      expect(customer).to include("O Nome não pode ser vazio")
    end

    it "phone is required" do
      customer = Customer::Customer.new(name, nil).create

      expect(customer).to include("O Phone não pode ser vazio")
    end

    it "validate phone duplicated" do
      customer = Customer::Customer.new(name, phone).create

      expect(customer).to include("Phone já existe")
    end
  end
end
