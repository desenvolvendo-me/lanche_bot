# frozen_string_literal: true

require "rails_helper"

RSpec.describe "menu_mains/index", type: :view do
  before(:each) do
    assign(:menu_mains, [
             MenuMain.create!(
               name: "Name",
               description: "Description",
               price: "9.99"
             ),
             MenuMain.create!(
               name: "Name",
               description: "Description",
               price: "9.99"
             )
           ])
  end

  it "renders a list of menu_mains" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: "Description".to_s, count: 2
    assert_select "tr>td", text: "9.99".to_s, count: 2
  end
end
