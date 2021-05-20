# frozen_string_literal: true

require "menu/menu_main"

RSpec.describe Menu::MenuMain do
  context "when the object is valid" do
    it "should validate object created" do
      menu_main = Menu::MenuMain.new("x-tudo", "um lanche muito bom", 15.0)
      expect(menu_main).to eq(menu_main)
    end
  end
end
