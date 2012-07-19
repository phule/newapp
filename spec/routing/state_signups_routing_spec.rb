require "spec_helper"

describe StateSignupsController do
  describe "routing" do

    it "routes to #index" do
      get("/state_signups").should route_to("state_signups#index")
    end

    it "routes to #new" do
      get("/state_signups/new").should route_to("state_signups#new")
    end

    it "routes to #show" do
      get("/state_signups/1").should route_to("state_signups#show", :id => "1")
    end

    it "routes to #edit" do
      get("/state_signups/1/edit").should route_to("state_signups#edit", :id => "1")
    end

    it "routes to #create" do
      post("/state_signups").should route_to("state_signups#create")
    end

    it "routes to #update" do
      put("/state_signups/1").should route_to("state_signups#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/state_signups/1").should route_to("state_signups#destroy", :id => "1")
    end

  end
end
