require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))

Given /^I am on the create meeting page$/ do
  visit('/meetings/new')
end

When /^I enter the note meeting of "(.*?)"$/ do |arg1|
  fill_in "notemeeting", :with => arg1
end

When /^I click on submit$/ do
  click_button("bttnCreateMeeting")
end

Then /^I should see "(.*?)"$/ do |arg1|
  arg1=Regexp.new(arg1)
  page.should have_content(arg1)
end