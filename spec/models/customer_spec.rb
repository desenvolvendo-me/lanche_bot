# frozen_string_literal: true

require "rails_helper"

RSpec.describe Customer, type: :model do
  before do
    @customer = FactoryBot.create(:customer, name: "Diego", phone: "999998888")
  end

  context "customer" do
    it "create" do
      expect(@customer.name).to eq("Diego")
      expect(@customer.phone).to eq("999998888")
    end
  end

  context "validations" do
    it { is_expected.to validate_presence_of(:phone) }
  end
end
