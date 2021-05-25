# frozen_string_literal: true

require "lanche_bot/sale/sale"

RSpec.describe "sale" do
  context "when the object is valid" do
    let(:menu_main) { Menu::MenuMain.new("x-tudo", "um lanche muito bom", 15.0) }
    let(:menu_juice) { Menu::MenuJuice.new("manga", "300ml", 12.00) }
    let(:combo) { Combo::Combo.new(menu_main, menu_juice) }
    let(:customer) { Customer::Customer.new("George Lemos") }
    let(:lunch) { Lunch::Lunch.new("x-tudo", 12.00) }
    let(:sale) { Sale::Sale.new(combo, customer, lunch, menu_juice, 20) }

    it "should validate object created" do
      expect(sale).to eq(sale)
      expect(sale.combo).to eq(combo)
      expect(sale.customer).to eq(customer)
      expect(sale.lunch).to eq(lunch)
      expect(sale.quantity).to eq(20)
    end
  end
end
