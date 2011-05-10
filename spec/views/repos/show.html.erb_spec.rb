require 'spec_helper'

describe "repos/show.html.erb" do
  before(:each) do
    @repo = assign(:repo, stub_model(Repo))
  end

  it "renders attributes in <p>" do
    render
  end
end
