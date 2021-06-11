# frozen_string_literal: true

require "lanche_bot/menu/menu_main"

RSpec.describe Menu::MenuMain do
  csv_path = "spec/fixtures/menu_mains-test.csv"
  header = %w[id name description price]

  before do
    stub_const("Menu::MenuMain::DATA_PATH", csv_path)
  end

  before(:each) do
    restart_csv(csv_path, header)
    @name = "Frango xadrez"
    @description = "frango delicioso"
    @price = "12.40"
    @menu_main = Menu::MenuMain.new({name: @name, description: @description, price: @price}).create
  end

  context "when the object is valid" do
    it "should validate object created" do
      menu_main = Menu::MenuMain.new({name: "x-tudo", description: "um lanche muito bom", price: 15.0}).create
      expect(menu_main).to eq(menu_main)
    end
  end
end
