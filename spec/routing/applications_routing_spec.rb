require "rails_helper"

RSpec.describe AgentApplicationsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/oauth/applications").to route_to("agent_applications#index")
    end

    it "routes to #new" do
      expect(:get => "/oauth/applications/new").to route_to("agent_applications#new")
    end

    it "routes to #show" do
      expect(:get => "/oauth/applications/1").to route_to("agent_applications#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/oauth/applications/1/edit").to route_to("agent_applications#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/oauth/applications").to route_to("agent_applications#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/oauth/applications/1").to route_to("agent_applications#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/oauth/applications/1").to route_to("agent_applications#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/oauth/applications/1").to route_to("agent_applications#destroy", :id => "1")
    end
  end
end
