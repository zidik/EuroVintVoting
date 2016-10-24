require 'rails_helper'

RSpec.describe "participants/index", :type => :view do
  before(:each) do
    assign(:participants, [
      Participant.create!(
        :country => "Country",
        :artist => "Artist",
        :title => "Title"
      ),
      Participant.create!(
        :country => "Country",
        :artist => "Artist",
        :title => "Title"
      )
    ])
  end

  it "renders a list of participants" do
    render
    assert_select "tr>td", :text => "Country".to_s, :count => 2
    assert_select "tr>td", :text => "Artist".to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
  end
end
