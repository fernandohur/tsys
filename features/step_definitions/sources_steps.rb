Then /^I should see (\d+) anchors$/ do |n|
  assert_equal( n.to_i,all('.btn').size)
end

Then /^there should be (\d+) sources$/ do |n|
  assert_equal(n.to_i,Source.all.size,"Sources size was #{Source.all.size}, but #{n} was expected")
end

When /^I accept the dialog$/ do
  page.driver.browser.switch_to.alert.accept
end

