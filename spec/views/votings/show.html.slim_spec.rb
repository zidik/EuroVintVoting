require 'rails_helper'

RSpec.describe "votings/show", :type => :view do
  before(:each) do
    @voting = assign(:voting, Voting.create!(
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
