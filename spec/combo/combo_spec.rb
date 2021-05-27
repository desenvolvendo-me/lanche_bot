# frozen_string_literal: true

require "lanche_bot/combo/combo"

def scenario
  before do
    @menu_main = Menu::MenuMain.new("X-Burger",
                                    "Pão, queijo, e hamburger",
                                    10.00)
    @menu_juice = Menu::MenuJuice.new("Laranja",
                                      "300 ml",
                                      3.00)
  end
end

RSpec.describe "combo" do
  scenario
  context "create" do
    it "criar" do
      combo = Combo::Combo.new(@menu_main, @menu_juice)

      expect(combo.menu_main.name).to eq("X-Burger")
      expect(combo.menu_juice.name).to eq("Laranja")
      expect(combo.menu_main.price).to eq(10.00)
      expect(combo.menu_juice.price).to eq(3.00)
    end
  end

  context "price" do
    it "10" do
      combo = Combo::Combo.new(@menu_main, @menu_juice, 2)

      expect(combo.price).to eq(10.0)
    end
  end

  context "free item" do
    it "mark item as free" do
      free_item = Combo::Combo.new(@menu_main, @menu_juice, 2).free_item

      expect(free_item).to eq(@menu_juice.name)
    end
  end
end
