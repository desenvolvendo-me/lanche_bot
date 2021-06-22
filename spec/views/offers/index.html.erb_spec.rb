# frozen_string_literal: true

require "rails_helper"

RSpec.describe "offers/index", type: :view do
  before(:each) do
    assign(:offers, [
             Offer.create!(
               price: "9.99",
               menu_juice: nil,
               menu_main: nil
             ),
             Offer.create!(
               price: "9.99",
               menu_juice: nil,
               menu_main: nil
             )
           ])
  end

  xit "renders a list of offers" do
    render
    assert_select "tr>td", text: "9.99".to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
