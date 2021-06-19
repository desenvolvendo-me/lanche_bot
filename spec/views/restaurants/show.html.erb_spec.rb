# frozen_string_literal: true

require "rails_helper"

RSpec.describe "restaurants/show", type: :view do
  before(:each) do
    @restaurant = assign(:restaurant, Restaurant.create!(
                                        name: "Name",
                                        address: "Address",
                                        is_open: false
                                      ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Address/)
    expect(rendered).to match(/false/)
  end
end
