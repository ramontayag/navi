# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

require '../../spec/blueprints'

Factory :page, :name => "Home"
Factory :page, :name => "About"

Factory :category, :name => "Cars"
Factory :category, :name => "Animals"
