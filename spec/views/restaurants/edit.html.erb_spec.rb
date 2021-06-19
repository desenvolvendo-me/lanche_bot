# frozen_string_literal: true

require "rails_helper"

RSpec.describe "restaurants/edit", type: :view do
  before(:each) do
    @restaurant = assign(:restaurant, Restaurant.create!(
                                        name: "MyString",
                                        address: "MyString",
                                        is_open: false
                                      ))
  end

  it "renders the edit restaurant form" do
    render

    assert_select "form[action=?][method=?]", restaurant_path(@restaurant), "post" do
      assert_select "input[name=?]", "restaurant[name]"

      assert_select "input[name=?]", "restaurant[address]"

      assert_select "input[name=?]", "restaurant[is_open]"
    end
  end
end
