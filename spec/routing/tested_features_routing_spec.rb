require "spec_helper"

describe TestedFeaturesController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/tested_features" }.should route_to(:controller => "tested_features", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/tested_features/new" }.should route_to(:controller => "tested_features", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/tested_features/1" }.should route_to(:controller => "tested_features", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/tested_features/1/edit" }.should route_to(:controller => "tested_features", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/tested_features" }.should route_to(:controller => "tested_features", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/tested_features/1" }.should route_to(:controller => "tested_features", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/tested_features/1" }.should route_to(:controller => "tested_features", :action => "destroy", :id => "1")
    end

  end
end
