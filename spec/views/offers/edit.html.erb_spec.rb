# frozen_string_literal: true

require "rails_helper"

RSpec.describe "offers/edit", type: :view do
  before(:each) do
    @offer = assign(:offer, Offer.create!(
                              price: "9.99",
                              menu_juice: nil,
                              menu_main: nil
                            ))
  end

  xit "renders the edit offer form" do
    render

    assert_select "form[action=?][method=?]", offer_path(@offer), "post" do
      assert_select "input[name=?]", "offer[price]"

      assert_select "input[name=?]", "offer[menu_juice_id]"

      assert_select "input[name=?]", "offer[menu_main_id]"
    end
  end
end
