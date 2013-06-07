Given /^a page "([^"]*)" exists$/ do |name|
  FactoryGirl.create :page, :name => name
end
