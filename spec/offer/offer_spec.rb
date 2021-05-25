# frozen_string_literal: true

require "lanche_bot/offer/offer"

RSpec.describe "offer" do
  context "when the object is valid" do
    let(:menu_main) { Menu::MenuMain.new("x-tudo", "um lanche muito bom", 15.0) }
    let(:menu_juice) { Menu::MenuJuice.new("manga", "300ml", 12.00) }
    let(:combo) { Combo::Combo.new(menu_main, menu_juice) }
    let(:customer) { Customer::Customer.new("George Lemos") }
    let(:lunch) { Lunch::Lunch.new("x-tudo", 12.00) }
    let(:offer) { Offer::Offer.new(combo, customer, lunch, menu_juice, 20) }

    it "should validate object created" do
      expect(offer).to eq(offer)
      expect(offer.combo).to eq(combo)
      expect(offer.customer).to eq(customer)
      expect(offer.lunch).to eq(lunch)
      expect(offer.quantity).to eq(20)
    end
  end
end
