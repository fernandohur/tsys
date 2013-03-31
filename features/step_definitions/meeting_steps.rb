begin
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))

When /^I enter the note meeting of "(.*?)"$/ do |arg1|
  fill_in "noteMeeting", :with => arg1
end

Then /^I should carlossee "(.*?)"$/ do |arg1|
  arg1=Regexp.new(arg1)
  assert page.has_content?(arg1)
end
end
