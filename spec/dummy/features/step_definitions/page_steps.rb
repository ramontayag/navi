Given /^a page "([^"]*)" exists$/ do |name|
  Page.make :name => name
end
