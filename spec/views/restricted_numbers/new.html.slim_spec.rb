require 'rails_helper'

RSpec.describe "restricted_numbers/new", type: :view do
  before(:each) do
    assign(:restricted_number, RestrictedNumber.new(
      :name => "MyString",
      :number => "MyString"
    ))
  end

  it "renders new restricted_number form" do
    render

    assert_select "form[action=?][method=?]", restricted_numbers_path, "post" do

      assert_select "input#restricted_number_name[name=?]", "restricted_number[name]"

      assert_select "input#restricted_number_number[name=?]", "restricted_number[number]"
    end
  end
end
