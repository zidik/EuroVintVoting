require 'rails_helper'

RSpec.describe "votings/edit", :type => :view do
  before(:each) do
    @voting = assign(:voting, Voting.create!(
      :name => "MyString"
    ))
  end

  it "renders the edit voting form" do
    render

    assert_select "form[action=?][method=?]", voting_path(@voting), "post" do

      assert_select "input#voting_name[name=?]", "voting[name]"
    end
  end
end
