=begin
Given /^I am in the create thesis page$/ do
  visit('/theses/new')
end

When /^I enter nothing as a name$/ do
  fill_in "thesis_name", :with => "shrt"
end

When /^I enter a valid name for the thesis$/ do
  fill_in "thesis_name", :with => "test_thesis"
end

When /^I click on submit button$/ do
  click_button("Create Thesis")
end
=end



