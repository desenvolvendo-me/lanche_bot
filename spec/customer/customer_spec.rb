require "lanche_bot/customer/customer"

RSpec.describe "customer" do
	it 'criar' do 
   customer = Customer.new("levi")

   expect(customer.name).to eq("levi")
  end

end
