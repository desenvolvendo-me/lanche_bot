# frozen_string_literal: true

require "rails_helper"

RSpec.describe "orders/show", type: :view do
  before(:each) do
    @order = assign(:order, Order.create!(
                              customer: nil,
                              menu_juice: nil,
                              menu_main: nil,
                              restaurant: nil
                            ))
  end

  xit "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
