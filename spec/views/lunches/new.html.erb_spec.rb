# frozen_string_literal: true

require "rails_helper"

RSpec.describe "lunches/new", type: :view do
  before(:each) do
    assign(:lunch, Lunch.new(
                     name: "MyString",
                     price: "9.99"
                   ))
  end

  it "renders new lunch form" do
    render

    assert_select "form[action=?][method=?]", lunches_path, "post" do
      assert_select "input[name=?]", "lunch[name]"

      assert_select "input[name=?]", "lunch[price]"
    end
  end
end
