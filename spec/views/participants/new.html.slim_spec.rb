require 'rails_helper'

RSpec.describe "participants/new", :type => :view do
  before(:each) do
    assign(:participant, Participant.new(
      :country => "MyString",
      :artist => "MyString",
      :title => "MyString"
    ))
  end

  it "renders new participant form" do
    render

    assert_select "form[action=?][method=?]", participants_path, "post" do

      assert_select "input#participant_country[name=?]", "participant[country]"

      assert_select "input#participant_artist[name=?]", "participant[artist]"

      assert_select "input#participant_title[name=?]", "participant[title]"
    end
  end
end
