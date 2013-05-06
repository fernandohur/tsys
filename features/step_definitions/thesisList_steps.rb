Given /^I am in the index thesis page$/ do
  visit('/theses')
end

Given /^I am a professor managing one or more thesis$/ do
  Thesis.new(:name =>"pruebaTesisNueva1").save
  Thesis.new(:name =>"pruebaTesisNueva2").save
end

Given /^I am a professor managing zero thesis$/ do
  Thesis.delete_all
end
