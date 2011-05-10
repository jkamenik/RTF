require 'spec_helper'

describe "tested_features/index.html.erb" do
  before(:each) do
    assign(:tested_features, [
      stub_model(TestedFeature),
      stub_model(TestedFeature)
    ])
  end

  it "renders a list of tested_features" do
    render
  end
end
