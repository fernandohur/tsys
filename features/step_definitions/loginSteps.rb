When /^I enter the field_password with (.*)$/ do |password|
  fill_in "password", :with => password

end

When /^I enter the field_username with (.*)$/ do |userName|
  fill_in "username", :with => userName
end

Given /^I am in the loginPage$/ do
  visit '/login'
end

When /^I click on Login$/ do
  click_button("login")
end