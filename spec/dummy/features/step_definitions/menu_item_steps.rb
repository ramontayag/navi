When /^I create the page "([^"]*)" menu item$/ do |page_name|
  within "div#menu_item_page_form" do
    select page_name, :from => "menu_item_navigable_id"
    click_button "Save Menu Item"
  end
end

When /^I create the category "([^"]*)" menu item$/ do |category_name|
  within "div#menu_item_category_form" do
    select category_name, :from => "menu_item_navigable_id"
    click_button "Save Menu Item"
  end
end

Then /^I should see "([^"]*)" in the list of menu items$/ do |text|
  within "div#menu_item_tree" do
    page.should have_content(text)
  end
end
