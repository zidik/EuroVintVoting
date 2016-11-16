require 'rails_helper'

RSpec.describe Auth0Controller, type: :controller do

  describe "GET #callback" do
  end

  describe "GET #failure" do
    it "returns http success" do
      get :failure
      expect(response).to have_http_status(:success)
    end
  end

end
