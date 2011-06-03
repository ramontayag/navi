require 'navigable/navigation_item/instance_methods'

module Navigable
  module NavigationItem
    extend ActiveSupport::Concern
    included do
      belongs_to :navigable, :polymorphic => true
    end
    included Navigable::NavigationItem::InstanceMethods
  end
end
