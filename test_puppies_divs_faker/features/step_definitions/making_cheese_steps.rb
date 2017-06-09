Given /^I have no cheese$/ do
  puts "I am so sad. I have no cheese :("
end

When /^I press the make cheese button$/ do
  puts "There is hope. I hope this machine workds"
end

Then /^I should have (\d+) piece of cheese$/ do |num_pieces|
  puts "Rejoice! We have #{num_pieces} pieces of cheese."
end