require "spec_helper"

describe TaskInstancesController do
  describe "routing" do

    it "routes to #index" do
      get("/task_instances").should route_to("task_instances#index")
    end

    it "routes to #new" do
      get("/task_instances/new").should route_to("task_instances#new")
    end

    it "routes to #show" do
      get("/task_instances/1").should route_to("task_instances#show", :id => "1")
    end

    it "routes to #edit" do
      get("/task_instances/1/edit").should route_to("task_instances#edit", :id => "1")
    end

    it "routes to #create" do
      post("/task_instances").should route_to("task_instances#create")
    end

    it "routes to #update" do
      put("/task_instances/1").should route_to("task_instances#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/task_instances/1").should route_to("task_instances#destroy", :id => "1")
    end

  end
end
