require 'spec_helper'

describe "repos/new.html.erb" do
  before(:each) do
    assign(:repo, stub_model(Repo).as_new_record)
  end

  it "renders new repo form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => repos_path, :method => "post" do
    end
  end
end
