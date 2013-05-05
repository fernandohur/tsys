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

Given /^I am in the index thesis page$/ do
  visit('/theses')
end

Given /^I am a professor managing one or more thesis$/ do
  Thesis.new(:name =>"pruebaTest", :student_id => 1).save
  Thesis.new(:name =>"pruebaTest2", :student_id => 1).save
  visit('/theses')
end

Given /^I am a professor managing zero thesis$/ do
  Thesis.delete_all
end


