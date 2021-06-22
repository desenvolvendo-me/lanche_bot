# frozen_string_literal: true

require "rails_helper"

RSpec.describe "offers/new", type: :view do
  before(:each) do
    assign(:offer, Offer.new(
                     price: "9.99",
                     menu_juice: nil,
                     menu_main: nil
                   ))
  end

  it "renders new offer form" do
    render

    assert_select "form[action=?][method=?]", offers_path, "post" do
      assert_select "input[name=?]", "offer[price]"

      assert_select "input[name=?]", "offer[menu_juice_id]"

      assert_select "input[name=?]", "offer[menu_main_id]"
    end
  end
end
