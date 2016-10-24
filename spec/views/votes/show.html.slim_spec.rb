require 'rails_helper'

RSpec.describe "votes/show", :type => :view do
  before(:each) do
    @vote = assign(:vote, Vote.create!(
      :registration => nil,
      :from_phone => "From Phone",
      :to_phone => "To Phone",
      :from_country => "From Country"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/From Phone/)
    expect(rendered).to match(/To Phone/)
    expect(rendered).to match(/From Country/)
  end
end
