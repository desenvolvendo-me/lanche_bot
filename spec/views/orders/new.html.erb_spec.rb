# frozen_string_literal: true

require "rails_helper"

RSpec.describe "orders/new", type: :view do
  before(:each) do
    assign(:order, Order.new(
                     customer: nil,
                     menu_juice: nil,
                     menu_main: nil,
                     restaurant: nil
                   ))
  end

  it "renders new order form" do
    render

    assert_select "form[action=?][method=?]", orders_path, "post" do
      assert_select "input[name=?]", "order[customer_id]"

      assert_select "input[name=?]", "order[menu_juice_id]"

      assert_select "input[name=?]", "order[menu_main_id]"

      assert_select "input[name=?]", "order[restaurant_id]"
    end
  end
end
