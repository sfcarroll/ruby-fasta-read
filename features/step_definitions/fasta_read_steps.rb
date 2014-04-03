# Put your step definitions here
Then(/^the banner should document that this app's arguments are$/) do |table|
  expected_arguments = table.raw.map { |row|
    option = row[0]
    option = "[#{option}]" if row[1] == 'optional' || row[1] == 'which is optional'
    option
  }.join(' ')
  step %(the output should contain "#{expected_arguments}")
end

Given(/^an assembly file at "(.*?)"$/) do |assembly_path|
  steps %(Given a file named "#{assembly_path}")
end
