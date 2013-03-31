=begin
Given /^I am in the register studentPage$/ do
  visit '/students/new'
end

When /^I enter the field_name with (.*)$/ do |studentName|
  @nameTest = studentName
  fill_in "student_name", :with => studentName
end

When /^I enter the Students username of (.*)$/ do |studentUsername|
  @usernameTest = studentUsername
  fill_in "username", :with => studentUsername
end

When /^I enter the Students password of (.*)$/ do  |studentPass|
  @passTest = studentPass
  fill_in "password", :with => studentPass
end

When /^I click on Register$/ do
  click_button("register")
end

Then /^I should see text equal to (.*)$/ do |text|
  page.should have_content(text)
end

Given /^there are no students$/ do
  Student.delete_all
end

Given /^there are students with the same userNameTest$/ do
  Student.new(:name =>@nameTest, :password =>@passTest, :thesis_id => 1, :username => @usernameTest).save
end
=end



