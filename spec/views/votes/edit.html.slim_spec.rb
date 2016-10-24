require 'rails_helper'

RSpec.describe "votes/edit", :type => :view do
  before(:each) do
    @vote = assign(:vote, Vote.create!(
      :registration => nil,
      :from_phone => "MyString",
      :to_phone => "MyString",
      :from_country => "MyString"
    ))
  end

  it "renders the edit vote form" do
    render

    assert_select "form[action=?][method=?]", vote_path(@vote), "post" do

      assert_select "input#vote_registration_id[name=?]", "vote[registration_id]"

      assert_select "input#vote_from_phone[name=?]", "vote[from_phone]"

      assert_select "input#vote_to_phone[name=?]", "vote[to_phone]"

      assert_select "input#vote_from_country[name=?]", "vote[from_country]"
    end
  end
end
