require 'rails_helper'

RSpec.describe "participants/edit", :type => :view do
  before(:each) do
    @participant = assign(:participant, Participant.create!(
      :country => "MyString",
      :artist => "MyString",
      :title => "MyString"
    ))
  end

  it "renders the edit participant form" do
    render

    assert_select "form[action=?][method=?]", participant_path(@participant), "post" do

      assert_select "input#participant_country[name=?]", "participant[country]"

      assert_select "input#participant_artist[name=?]", "participant[artist]"

      assert_select "input#participant_title[name=?]", "participant[title]"
    end
  end
end
