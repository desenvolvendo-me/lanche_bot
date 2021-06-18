require 'rails_helper'

RSpec.describe "restaurants/new", type: :view do
  before(:each) do
    assign(:restaurant, Restaurant.new(
      name: "MyString",
      address: "MyString",
      is_open: false
    ))
  end

  it "renders new restaurant form" do
    render

    assert_select "form[action=?][method=?]", restaurants_path, "post" do

      assert_select "input[name=?]", "restaurant[name]"

      assert_select "input[name=?]", "restaurant[address]"

      assert_select "input[name=?]", "restaurant[is_open]"
    end
  end
end
