# frozen_string_literal: true

require "lanche_bot/menu/menu_soda"

RSpec.describe Menu::MenuSoda do
  context "when the object is valid" do
    let(:menu_soda) { Menu::MenuSoda.new("Fanta Laranja", "KS", 2.00) }
    it "should validate object created" do
      expect(menu_soda).to eq(menu_soda)
    end

    it "should return name, type, price" do
      expect(menu_soda.name).to eq("Fanta Laranja")
      expect(menu_soda.type).to eq("KS")
      expect(menu_soda.price).to eq(2.00)
    end
  end
end
