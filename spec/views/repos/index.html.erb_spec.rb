require 'spec_helper'

describe "repos/index.html.erb" do
  before(:each) do
    assign(:repos, [
      stub_model(Repo),
      stub_model(Repo)
    ])
  end

  it "renders a list of repos" do
    render
  end
end
