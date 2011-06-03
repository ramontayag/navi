module Navigable
  module InstanceMethods
    def to_navigator(options={})
      return nav_item if nav_item
      options.merge!(:navigable => self)
      NavItem.new options
    end
  end
end
