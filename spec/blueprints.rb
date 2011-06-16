require 'machinist/active_record'
require 'sham'
require 'faker'

Sham.name  { Faker::Name.name }
Sham.email { Faker::Internet.email }
Sham.title { Faker::Lorem.sentence }
Sham.body  { Faker::Lorem.paragraph }
#Sham.url  { "http://somedomain.com" }

Category.blueprint do
  name
end

MenuItem.blueprint do
  label {Sham.name}
  url { "http://somedomain.com" }
  site_id {1}
end

Page.blueprint do
  name
end
