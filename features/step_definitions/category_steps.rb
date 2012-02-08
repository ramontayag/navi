Given /^a category "([^"]*)" exists$/ do |name|
  Factory :category, :name => name
end
