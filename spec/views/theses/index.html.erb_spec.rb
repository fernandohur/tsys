require 'spec_helper'

describe "theses/index" do
  before(:each) do
    assign(:theses, [
      stub_model(Thesis),
      stub_model(Thesis)
    ])
  end

  it "renders a list of theses" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
