# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

FactoryGirl.create :page, :name => "Home"
FactoryGirl.create :page, :name => "About"

FactoryGirl.create :category, :name => "Cars"
FactoryGirl.create :category, :name => "Animals"
