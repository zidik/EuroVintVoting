require 'rails_helper'

RSpec.describe "restricted_numbers/show", type: :view do
  before(:each) do
    @restricted_number = assign(:restricted_number, RestrictedNumber.create!(
      :name => "Name",
      :number => "Number"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Number/)
  end
end
