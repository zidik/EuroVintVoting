require 'rails_helper'

RSpec.describe "votings/index", :type => :view do
  before(:each) do
    assign(:votings, [
      Voting.create!(
        :name => "Name"
      ),
      Voting.create!(
        :name => "Name"
      )
    ])
  end

  it "renders a list of votings" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
