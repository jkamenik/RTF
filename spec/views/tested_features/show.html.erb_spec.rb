require 'spec_helper'

describe "tested_features/show.html.erb" do
  before(:each) do
    @tested_feature = assign(:tested_feature, stub_model(TestedFeature))
  end

  it "renders attributes in <p>" do
    render
  end
end
