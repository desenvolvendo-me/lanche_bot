require "rails_helper"

RSpec.describe "menu_mains/new", type: :view do
  before(:each) do
    assign(:menu_main, MenuMain.new(
                         name: "MyString",
                         description: "MyString",
                         price: "9.99"
                       ))
  end

  it "renders new menu_main form" do
    render

    assert_select "form[action=?][method=?]", menu_mains_path, "post" do
      assert_select "input[name=?]", "menu_main[name]"

      assert_select "input[name=?]", "menu_main[description]"

      assert_select "input[name=?]", "menu_main[price]"
    end
  end
end
