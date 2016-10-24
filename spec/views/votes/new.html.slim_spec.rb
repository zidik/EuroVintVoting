require 'rails_helper'

RSpec.describe "votes/new", :type => :view do
  before(:each) do
    assign(:vote, Vote.new(
      :registration => nil,
      :from_phone => "MyString",
      :to_phone => "MyString",
      :from_country => "MyString"
    ))
  end

  it "renders new vote form" do
    render

    assert_select "form[action=?][method=?]", votes_path, "post" do

      assert_select "input#vote_registration_id[name=?]", "vote[registration_id]"

      assert_select "input#vote_from_phone[name=?]", "vote[from_phone]"

      assert_select "input#vote_to_phone[name=?]", "vote[to_phone]"

      assert_select "input#vote_from_country[name=?]", "vote[from_country]"
    end
  end
end
