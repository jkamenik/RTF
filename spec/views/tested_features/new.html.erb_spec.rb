require 'spec_helper'

describe "tested_features/new.html.erb" do
  before(:each) do
    assign(:tested_feature, stub_model(TestedFeature).as_new_record)
  end

  it "renders new tested_feature form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => tested_features_path, :method => "post" do
    end
  end
end
