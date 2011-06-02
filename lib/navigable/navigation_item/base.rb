module Navigable
  module NavigationItem
    extend ActiveSupport::Concern

    included do
      belongs_to :navigable, :polymorphic => true
    end

    def label
      db_value = self.read_attribute :label
      return db_value if db_value
      return navigable.send navigable_config(:label) if navigable
      nil
    end

    private

    def navigable_config(key)
      navigable.class.navigable_config[key]
    end
  end
end
