# frozen_string_literal: true

require "rails_helper"

RSpec.describe "lunches/show", type: :view do
  before(:each) do
    @lunch = assign(:lunch, Lunch.create!(
                              name: "Name",
                              price: "9.99"
                            ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/9.99/)
  end
end
