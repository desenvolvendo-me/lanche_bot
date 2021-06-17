# frozen_string_literal: true

require "rails_helper"

RSpec.describe Customer, type: :model do
  context "customer" do
    it "create" do
      customer = FactoryBot.create(:customer, name: "Diego", phone: "999998888")

      expect(customer.name).to eq("Diego")
      expect(customer.phone).to eq("999998888")
    end
  end
end
