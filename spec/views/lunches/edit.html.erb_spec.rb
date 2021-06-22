# frozen_string_literal: true

require "rails_helper"

RSpec.describe "lunches/edit", type: :view do
  before(:each) do
    @lunch = assign(:lunch, Lunch.create!(
                              name: "MyString",
                              price: "9.99"
                            ))
  end

  it "renders the edit lunch form" do
    render

    assert_select "form[action=?][method=?]", lunch_path(@lunch), "post" do
      assert_select "input[name=?]", "lunch[name]"

      assert_select "input[name=?]", "lunch[price]"
    end
  end
end
