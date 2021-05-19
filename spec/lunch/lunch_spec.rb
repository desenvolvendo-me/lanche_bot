require "lunch/lunch"

RSpec.describe Lunch do
  it "should create and validate object Lunch" do
    lunch = Lunch.new("X-bugger", 10)
    expect(lunch).to eq(lunch)
  end
end
