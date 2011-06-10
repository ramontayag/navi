class Page < ActiveRecord::Base
  navigable :label => :name
end
