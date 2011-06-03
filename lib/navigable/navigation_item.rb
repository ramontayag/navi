require 'navigable/navigation_item/class_methods'
require 'navigable/navigation_item/instance_methods'

module Navigable
  module NavigationItem
    def self.included(base)
      base.send :include, Navigable::NavigationItem::ClassMethods
      base.send :include, Navigable::NavigationItem::InstanceMethods
    end
  end
end
