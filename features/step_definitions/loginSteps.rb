When /^I enter the field_password with (.*)$/ do |password|
  @passTest=password
  fill_in "password", :with => password

end

When /^I enter the field_username with (.*)$/ do |userName|
  @usernameTest=userName
  fill_in "username", :with => userName

end

Given /^I am in the loginPage$/ do
  visit '/login'
end

When /^I click on Login$/ do
  click_button("login")
end

Given /^there are students with the same userNameTestL$/ do
  Student.new(:name =>@usernameTest, :password =>@passTest,:username => @usernameTest).save
end