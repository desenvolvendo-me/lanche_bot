# frozen_string_literal: true
require "lunch/lunch"

RSpec.describe Lunch do
  it "should create and validate object Lunch" do
    lunch = Lunch::Lunch.new("X-bugger", 10)
    expect(lunch).to eq(lunch)
  end
end
