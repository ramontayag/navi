Given /^a category "([^"]*)" exists$/ do |name|
  Category.make :name => name
end
