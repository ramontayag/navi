module Navigable
  module NavigationItem
    module ClassMethods
      extend ActiveSupport::Concern
      included do
        belongs_to :navigable, :polymorphic => true
      end
    end
  end
end
