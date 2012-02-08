Given /^a page "([^"]*)" exists$/ do |name|
  Factory :page, :name => name
end
