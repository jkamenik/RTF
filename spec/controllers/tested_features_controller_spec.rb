require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by the Rails when you ran the scaffold generator.

describe TestedFeaturesController do

  def mock_tested_feature(stubs={})
    @mock_tested_feature ||= mock_model(TestedFeature, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all tested_features as @tested_features" do
      TestedFeature.stub(:all) { [mock_tested_feature] }
      get :index
      assigns(:tested_features).should eq([mock_tested_feature])
    end
  end

  describe "GET show" do
    it "assigns the requested tested_feature as @tested_feature" do
      TestedFeature.stub(:find).with("37") { mock_tested_feature }
      get :show, :id => "37"
      assigns(:tested_feature).should be(mock_tested_feature)
    end
  end

  describe "GET new" do
    it "assigns a new tested_feature as @tested_feature" do
      TestedFeature.stub(:new) { mock_tested_feature }
      get :new
      assigns(:tested_feature).should be(mock_tested_feature)
    end
  end

  describe "GET edit" do
    it "assigns the requested tested_feature as @tested_feature" do
      TestedFeature.stub(:find).with("37") { mock_tested_feature }
      get :edit, :id => "37"
      assigns(:tested_feature).should be(mock_tested_feature)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "assigns a newly created tested_feature as @tested_feature" do
        TestedFeature.stub(:new).with({'these' => 'params'}) { mock_tested_feature(:save => true) }
        post :create, :tested_feature => {'these' => 'params'}
        assigns(:tested_feature).should be(mock_tested_feature)
      end

      it "redirects to the created tested_feature" do
        TestedFeature.stub(:new) { mock_tested_feature(:save => true) }
        post :create, :tested_feature => {}
        response.should redirect_to(tested_feature_url(mock_tested_feature))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved tested_feature as @tested_feature" do
        TestedFeature.stub(:new).with({'these' => 'params'}) { mock_tested_feature(:save => false) }
        post :create, :tested_feature => {'these' => 'params'}
        assigns(:tested_feature).should be(mock_tested_feature)
      end

      it "re-renders the 'new' template" do
        TestedFeature.stub(:new) { mock_tested_feature(:save => false) }
        post :create, :tested_feature => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested tested_feature" do
        TestedFeature.stub(:find).with("37") { mock_tested_feature }
        mock_tested_feature.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :tested_feature => {'these' => 'params'}
      end

      it "assigns the requested tested_feature as @tested_feature" do
        TestedFeature.stub(:find) { mock_tested_feature(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:tested_feature).should be(mock_tested_feature)
      end

      it "redirects to the tested_feature" do
        TestedFeature.stub(:find) { mock_tested_feature(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(tested_feature_url(mock_tested_feature))
      end
    end

    describe "with invalid params" do
      it "assigns the tested_feature as @tested_feature" do
        TestedFeature.stub(:find) { mock_tested_feature(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:tested_feature).should be(mock_tested_feature)
      end

      it "re-renders the 'edit' template" do
        TestedFeature.stub(:find) { mock_tested_feature(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested tested_feature" do
      TestedFeature.stub(:find).with("37") { mock_tested_feature }
      mock_tested_feature.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the tested_features list" do
      TestedFeature.stub(:find) { mock_tested_feature }
      delete :destroy, :id => "1"
      response.should redirect_to(tested_features_url)
    end
  end

end
