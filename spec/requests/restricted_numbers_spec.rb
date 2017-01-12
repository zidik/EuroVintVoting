require 'rails_helper'

RSpec.describe "RestrictedNumbers", type: :request do
  describe "GET /restricted_numbers" do
    it "works! (now write some real specs)" do
      get restricted_numbers_path
      expect(response).to have_http_status(200)
    end
  end
end
