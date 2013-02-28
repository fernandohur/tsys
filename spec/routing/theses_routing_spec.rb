require "spec_helper"

describe ThesesController do
  describe "routing" do

    it "routes to #index" do
      get("/theses").should route_to("theses#index")
    end

    it "routes to #new" do
      get("/theses/new").should route_to("theses#new")
    end

    it "routes to #show" do
      get("/theses/1").should route_to("theses#show", :id => "1")
    end

    it "routes to #edit" do
      get("/theses/1/edit").should route_to("theses#edit", :id => "1")
    end

    it "routes to #create" do
      post("/theses").should route_to("theses#create")
    end

    it "routes to #update" do
      put("/theses/1").should route_to("theses#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/theses/1").should route_to("theses#destroy", :id => "1")
    end

  end
end
