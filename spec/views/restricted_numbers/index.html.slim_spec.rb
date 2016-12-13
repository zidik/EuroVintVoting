require 'rails_helper'

RSpec.describe "restricted_numbers/index", type: :view do
  before(:each) do
    assign(:restricted_numbers, [
      RestrictedNumber.create!(
        :name => "Name",
        :number => "Number"
      ),
      RestrictedNumber.create!(
        :name => "Name",
        :number => "Number"
      )
    ])
  end

  it "renders a list of restricted_numbers" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Number".to_s, :count => 2
  end
end
