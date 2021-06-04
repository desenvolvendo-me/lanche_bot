# frozen_string_literal: true

RSpec.describe "customer" do
  csv_path = "spec/fixtures/customers-test.csv"
  header = %w[id name phone]

  before do
    stub_const("Customer::Customer::DATA_PATH", csv_path)
  end

  before(:each) do
    restart_csv(csv_path, header)
    @name = "Luciano"
    @phone = "18999999"
    @customer = Customer::Customer.new(@name, @phone, id: 1).create
  end

  it "criar" do
    expect(@customer.name).to eq(@name)
    expect(@customer.phone).to eq(@phone)
    expect(@customer.id).to be_truthy
  end

  it "get customer with id = 1" do
    customer = Customer::Customer.find("1")

    expect(customer.name).to eq("Luciano")
  end

  context "validate" do
    it "name is required" do
      customer = Customer::Customer.new("", @phone).create

      expect(customer).to include("O Nome não pode ser vazio")
    end

    it "phone is required" do
      customer = Customer::Customer.new(@name, nil).create

      expect(customer).to include("O Phone não pode ser vazio")
    end

    it "validate phone duplicated" do
      customer = Customer::Customer.new(@name, @phone).create

      expect(customer).to include("Phone já existe")
    end
  end
end
