require 'spec_helper'

describe "theses/edit" do
  before(:each) do
    @thesis = assign(:thesis, stub_model(Thesis))
  end

  it "renders the edit thesis form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", thesis_path(@thesis), "post" do
    end
  end
end
