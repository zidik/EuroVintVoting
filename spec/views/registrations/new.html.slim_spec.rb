require 'rails_helper'

RSpec.describe "registrations/new", :type => :view do
  before(:each) do
    assign(:registration, Registration.new(
      :voting => nil,
      :participant => nil
    ))
  end

  it "renders new registration form" do
    render

    assert_select "form[action=?][method=?]", registrations_path, "post" do

      assert_select "input#registration_voting_id[name=?]", "registration[voting_id]"

      assert_select "input#registration_participant_id[name=?]", "registration[participant_id]"
    end
  end
end
