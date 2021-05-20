# frozen_string_literal: true

require "lanche_bot/lanchonete/lanchonete"

RSpec.describe "Lanchonete" do
  context "create" do
    before do
      @name = "Godzilla"
      @address = "Rua do Divina Providência, nº 1234"
    end

    it "should return name" do
      lanchonete = Lanchonete::Lanchonete.new(@name, @address)

      expect(lanchonete.name).to eq(@name)
      expect(lanchonete.address).to eq(@address)
    end
  end
end
