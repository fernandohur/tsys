begin
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))

When /^I enter the note meeting of "(.*?)"$/ do |arg1|
  fill_in "noteMeeting", :with => arg1
end

Then /^I should carlossee "(.*?)"$/ do |arg1|
  arg1=Regexp.new(arg1)
  assert page.has_content?(arg1)
end

When /^I enter the meeting's note text  "(.*?)"$/ do |arg1|
  fill_in "meeting_note_noteText", :with => arg1
end

Given /^there is only (\d+) meeting notes with (\d+) files$/ do |notes, file|
  Meeting.delete_all
  (0..meetings.to_i-1).each do |i|

    s=Meeting.new
    (0..notes.to_i-1).each do |j|
      if file == 1
        s.meeting_notes.new(:note=>"note text", :path => "/Users/carlosduque/RubymineProjects/tsys/public/uploads/history.txt")
      end
    end
    s.save
  end
end

end
