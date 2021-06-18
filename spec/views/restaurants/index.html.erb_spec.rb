require 'rails_helper'

RSpec.describe "restaurants/index", type: :view do
  before(:each) do
    assign(:restaurants, [
      Restaurant.create!(
        name: "Name",
        address: "Address",
        is_open: false
      ),
      Restaurant.create!(
        name: "Name",
        address: "Address",
        is_open: false
      )
    ])
  end

  it "renders a list of restaurants" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: "Address".to_s, count: 2
    assert_select "tr>td", text: false.to_s, count: 2
  end
end
