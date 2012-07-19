require "spec_helper"

describe ReceiversController do
  describe "routing" do

    it "routes to #index" do
      get("/receivers").should route_to("receivers#index")
    end

    it "routes to #new" do
      get("/receivers/new").should route_to("receivers#new")
    end

    it "routes to #show" do
      get("/receivers/1").should route_to("receivers#show", :id => "1")
    end

    it "routes to #edit" do
      get("/receivers/1/edit").should route_to("receivers#edit", :id => "1")
    end

    it "routes to #create" do
      post("/receivers").should route_to("receivers#create")
    end

    it "routes to #update" do
      put("/receivers/1").should route_to("receivers#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/receivers/1").should route_to("receivers#destroy", :id => "1")
    end

  end
end
