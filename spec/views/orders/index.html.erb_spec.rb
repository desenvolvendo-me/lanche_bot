# frozen_string_literal: true

require "rails_helper"

RSpec.describe "orders/index", type: :view do
  before(:each) do
    assign(:orders, [
             Order.create!(
               customer: nil,
               menu_juice: nil,
               menu_main: nil,
               restaurant: nil
             ),
             Order.create!(
               customer: nil,
               menu_juice: nil,
               menu_main: nil,
               restaurant: nil
             )
           ])
  end

  xit "renders a list of orders" do
    render
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
