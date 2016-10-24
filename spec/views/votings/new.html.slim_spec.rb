require 'rails_helper'

RSpec.describe "votings/new", :type => :view do
  before(:each) do
    assign(:voting, Voting.new(
      :name => "MyString"
    ))
  end

  it "renders new voting form" do
    render

    assert_select "form[action=?][method=?]", votings_path, "post" do

      assert_select "input#voting_name[name=?]", "voting[name]"
    end
  end
end
