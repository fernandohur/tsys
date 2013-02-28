require 'spec_helper'

describe "theses/show" do
  before(:each) do
    @thesis = assign(:thesis, stub_model(Thesis))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
