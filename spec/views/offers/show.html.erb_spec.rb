# frozen_string_literal: true

require "rails_helper"

RSpec.describe "offers/show", type: :view do
  before(:each) do
    @offer = assign(:offer, Offer.create!(
                              price: "9.99",
                              menu_juice: nil,
                              menu_main: nil
                            ))
  end

  xit "renders attributes in <p>" do
    render
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
