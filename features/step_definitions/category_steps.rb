Given /^a category "([^"]*)" exists$/ do |name|
  FactoryGirl.create :category, name: name
end
