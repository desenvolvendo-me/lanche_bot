require "rails_helper"

RSpec.describe "menu_mains/edit", type: :view do
  before(:each) do
    @menu_main = assign(:menu_main, MenuMain.create!(
                                      name: "MyString",
                                      description: "MyString",
                                      price: "9.99"
                                    ))
  end

  it "renders the edit menu_main form" do
    render

    assert_select "form[action=?][method=?]", menu_main_path(@menu_main), "post" do
      assert_select "input[name=?]", "menu_main[name]"

      assert_select "input[name=?]", "menu_main[description]"

      assert_select "input[name=?]", "menu_main[price]"
    end
  end
end
