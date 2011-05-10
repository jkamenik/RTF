require 'spec_helper'

describe "tested_features/edit.html.erb" do
  before(:each) do
    @tested_feature = assign(:tested_feature, stub_model(TestedFeature))
  end

  it "renders the edit tested_feature form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => tested_features_path(@tested_feature), :method => "post" do
    end
  end
end
