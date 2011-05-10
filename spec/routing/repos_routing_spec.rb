require "spec_helper"

describe ReposController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/repos" }.should route_to(:controller => "repos", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/repos/new" }.should route_to(:controller => "repos", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/repos/1" }.should route_to(:controller => "repos", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/repos/1/edit" }.should route_to(:controller => "repos", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/repos" }.should route_to(:controller => "repos", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/repos/1" }.should route_to(:controller => "repos", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/repos/1" }.should route_to(:controller => "repos", :action => "destroy", :id => "1")
    end

  end
end
