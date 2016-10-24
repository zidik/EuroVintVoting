require 'rails_helper'

RSpec.describe "registrations/index", :type => :view do
  before(:each) do
    assign(:registrations, [
      Registration.create!(
        :voting => nil,
        :participant => nil
      ),
      Registration.create!(
        :voting => nil,
        :participant => nil
      )
    ])
  end

  it "renders a list of registrations" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
