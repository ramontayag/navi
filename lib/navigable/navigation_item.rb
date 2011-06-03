require 'navigable/navigation_item/class_methods'
require 'navigable/navigation_item/instance_methods'

module Navigable
  module NavigationItem
    def navigator
      ordered_tree
      include Navigable::NavigationItem::ClassMethods
      include Navigable::NavigationItem::InstanceMethods
    end
  end
end

ActiveRecord::Base.extend Navigable::NavigationItem
