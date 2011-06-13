module Navi
  module Navigator
    module ClassMethods
      extend ActiveSupport::Concern
      included do |child|
        # So that Rails won't consider this to be an STI table.
        # The actual project can have a model and inherit it this way:
        #   class MyNavItem < Navigable::NavigationItem::Base
        #
        # Then the navigable classes must tell the gem that the name of
        # the nav item is :my_nav_item, this way: navigable :navigator => :my_nav_item
        self.abstract_class = true

        belongs_to :navigable, :polymorphic => true

        # Calling ordered_tree on the child is important because
        # of this: http://stackoverflow.com/q/6262033/61018
        # where ordered_tree was picking up the Navi::Navigator::Base's
        # information, rather than whatever inherits Base class
        def self.inherited(child)
          child.send 'ordered_tree'
          super # super, so that Rails can continue to do what it's needs
        end
      end
    end
  end
end
