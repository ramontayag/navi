FactoryGirl.define do
  factory :category do
    name "Name"
  end

  factory :menu_item do
    label "Some menu item name"
    url "http://somedomain.com"
    site_id 1
  end

  factory :page do
    name "Some page name"
  end
end
