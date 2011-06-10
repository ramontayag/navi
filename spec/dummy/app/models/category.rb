class Category < ActiveRecord::Base
  navigable :label => :name
end
