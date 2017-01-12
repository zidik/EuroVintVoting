require 'rails_helper'

RSpec.describe "restricted_numbers/edit", type: :view do
  before(:each) do
    @restricted_number = assign(:restricted_number, RestrictedNumber.create!(
      :name => "MyString",
      :number => "MyString"
    ))
  end

  it "renders the edit restricted_number form" do
    render

    assert_select "form[action=?][method=?]", restricted_number_path(@restricted_number), "post" do

      assert_select "input#restricted_number_name[name=?]", "restricted_number[name]"

      assert_select "input#restricted_number_number[name=?]", "restricted_number[number]"
    end
  end
end
