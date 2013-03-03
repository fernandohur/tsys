require 'spec_helper'

describe "theses/new" do
  before(:each) do
    assign(:thesis, stub_model(Thesis).as_new_record)
  end

  it "renders new thesis form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", theses_path, "post" do
    end
  end
end
