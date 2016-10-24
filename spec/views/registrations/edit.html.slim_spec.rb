require 'rails_helper'

RSpec.describe "registrations/edit", :type => :view do
  before(:each) do
    @registration = assign(:registration, Registration.create!(
      :voting => nil,
      :participant => nil
    ))
  end

  it "renders the edit registration form" do
    render

    assert_select "form[action=?][method=?]", registration_path(@registration), "post" do

      assert_select "input#registration_voting_id[name=?]", "registration[voting_id]"

      assert_select "input#registration_participant_id[name=?]", "registration[participant_id]"
    end
  end
end
