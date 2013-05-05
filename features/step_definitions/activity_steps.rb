Given /^that I am in the activities index page$/ do
  visit('/activities')
end

Given /^That I am a student with username (.*)$/ do |studentName|
  @studentNewActivity=studentName
end

When /^I click on Create$/ do
  click_button("createActivity")
end

Given /^I want to add an activity with name (.*)$/ do |activitytName|
  @activityNewName=activitytName
end

Given /^I want to add a comment to an activity (.*)$/ do |activitytName|
  @activityNewComment=activitytName
end

Given /^with text (.*)$/ do |comment|
  @comment=comment
end