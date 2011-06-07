module Navi
  module Navigator
    module ClassMethods
      extend ActiveSupport::Concern
      included do
        # So that Rails won't consider this to be an STI table.
        # The actual project can have a model and inherit it this way:
        #   class MyNavItem < Navigable::NavigationItem::Base
        #
        # Then the navigable classes must tell the gem that the name of
        # the nav item is :my_nav_item, this way: navigable :navigator => :my_nav_item
        self.abstract_class = true

        puts "#{self} was included"
        puts "#{self.ancestors.join(",")}"
        ordered_tree
        belongs_to :navigable, :polymorphic => true
      end
    end
  end
end
