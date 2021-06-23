# frozen_string_literal: true

require "rails_helper"

RSpec.describe "orders/edit", type: :view do
  before(:each) do
    @order = assign(:order, Order.create!(
                              customer: nil,
                              menu_juice: nil,
                              menu_main: nil,
                              restaurant: nil
                            ))
  end

  xit "renders the edit order form" do
    render

    assert_select "form[action=?][method=?]", order_path(@order), "post" do
      assert_select "input[name=?]", "order[customer_id]"

      assert_select "input[name=?]", "order[menu_juice_id]"

      assert_select "input[name=?]", "order[menu_main_id]"

      assert_select "input[name=?]", "order[restaurant_id]"
    end
  end
end
