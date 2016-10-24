require 'rails_helper'

RSpec.describe "votes/index", :type => :view do
  before(:each) do
    assign(:votes, [
      Vote.create!(
        :registration => nil,
        :from_phone => "From Phone",
        :to_phone => "To Phone",
        :from_country => "From Country"
      ),
      Vote.create!(
        :registration => nil,
        :from_phone => "From Phone",
        :to_phone => "To Phone",
        :from_country => "From Country"
      )
    ])
  end

  it "renders a list of votes" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "From Phone".to_s, :count => 2
    assert_select "tr>td", :text => "To Phone".to_s, :count => 2
    assert_select "tr>td", :text => "From Country".to_s, :count => 2
  end
end
