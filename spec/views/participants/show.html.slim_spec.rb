require 'rails_helper'

RSpec.describe "participants/show", :type => :view do
  before(:each) do
    @participant = assign(:participant, Participant.create!(
      :country => "Country",
      :artist => "Artist",
      :title => "Title"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Country/)
    expect(rendered).to match(/Artist/)
    expect(rendered).to match(/Title/)
  end
end
