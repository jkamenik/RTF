require 'spec_helper'

describe "repos/edit.html.erb" do
  before(:each) do
    @repo = assign(:repo, stub_model(Repo))
  end

  it "renders the edit repo form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => repos_path(@repo), :method => "post" do
    end
  end
end
