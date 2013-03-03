Given /^there is only (\d+) source with (\d+) note$/ do |sources, notes|
  Source.delete_all
  (0..sources.to_i-1).each do |i|

    s=Source.new
    (0..notes.to_i-1).each do |j|
      s.notes.new(:noteText=>"note text")
    end
    s.save
  end
end

When /^I click the first "([^\"]*)"$/ do |link|
  first(:link, link).click
end