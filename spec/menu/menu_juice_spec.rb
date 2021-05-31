# frozen_string_literal: true

require "lanche_bot/menu/menu_juice"

RSpec.describe Menu::MenuJuice do
  context "when the object is valid" do
    let(:menu_juice) { Menu::MenuJuice.new("manga", "300ml", 12.00) }
    it "should validate object created" do
      expect(menu_juice).to eq(menu_juice)
    end

    it "should return name, cup_size, price" do
      expect(menu_juice.name).to eq("manga")
      expect(menu_juice.cup_size).to eq("300ml")
      expect(menu_juice.price).to eq(12.00)
    end
  end
end
