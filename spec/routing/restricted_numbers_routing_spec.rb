require "rails_helper"

RSpec.describe RestrictedNumbersController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/restricted_numbers").to route_to("restricted_numbers#index")
    end

    it "routes to #new" do
      expect(:get => "/restricted_numbers/new").to route_to("restricted_numbers#new")
    end

    it "routes to #show" do
      expect(:get => "/restricted_numbers/1").to route_to("restricted_numbers#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/restricted_numbers/1/edit").to route_to("restricted_numbers#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/restricted_numbers").to route_to("restricted_numbers#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/restricted_numbers/1").to route_to("restricted_numbers#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/restricted_numbers/1").to route_to("restricted_numbers#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/restricted_numbers/1").to route_to("restricted_numbers#destroy", :id => "1")
    end

  end
end
