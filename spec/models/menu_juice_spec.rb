# frozen_string_literal: true

require "rails_helper"

RSpec.describe MenuJuice, type: :model do
  before do
    @menu_juice = FactoryBot.create(:menu_juice, name: "acerola", cup_size: "300", price: "5")
  end

  context "menu_juice" do
    it "create" do
      expect(@menu_juice.name).to eq("acerola")
      expect(@menu_juice.cup_size).to eq("300")
      expect(@menu_juice.price).to eq("5")
    end
  end

  context "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:cup_size) }
    it { is_expected.to validate_presence_of(:price) }
  end
end
