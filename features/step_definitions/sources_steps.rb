Then /^I should see (\d+) anchors$/ do |n|
  assert_equal( n.to_i,all('.btn').size)
end

Then /^there should be (\d+) sources$/ do |n|
  assert_equal(n.to_i,Source.all.size,"Sources size was #{Source.all.size}, but #{n} was expected")
end

When /^I accept the dialog$/ do
  page.driver.browser.switch_to.alert.accept
end

Given /^I create a source with name = "(.*?)"$/ do |name|

  s = Source.new
  s.name = name
  s.save

end

Given /^there are no sources$/ do
  Source.delete_all
end

Then /^the source in position (\d+) should have "(.*?)"$/ do |position, text|
  all('.well').each_with_index { |item, index|
    if index == position then
      item.shoud have_content(text)
    end
  }
end

Then /^there should be (\d+) meetings$/ do |n|
  assert_equal(n.to_i,Meeting.all.size,"Meetings size was #{Meeting.all.size}, but #{n} was expected")
end

