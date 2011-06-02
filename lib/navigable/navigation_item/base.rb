module Navigable
  module NavigationItem
    extend ActiveSupport::Concern

    included do
      belongs_to :navigable, :polymorphic => true
    end

    def label
      db_value = self.read_attribute :label
      return db_value if db_value
      return navigable.send navigable_config(:label) if navigable && navigable_config(:label)
      nil
    end

    def link
      db_value = self.read_attribute :link
      return db_value if db_value
      return navigable if navigable
      nil
    end

    def title
      db_value = self.read_attribute :title
      return db_value if db_value
      if navigable && navigable_config(:title)
        config = navigable_config :title
        return navigable.send config if config.is_a?(Symbol)
        return config if config.is_a?(String)
        return config.call navigable if config.is_a?(Proc)
      end
      return self.label
    end

    def highlights_on
      db_value = self.read_attribute :highlights_on
      value = if db_value
        Regexp.new db_value
      else # db_value.nil?
        if navigable && navigable_config(:highlights_on)
          config = navigable_config(:highlights_on)
          return config.call navigable if config.is_a?(Proc)
          config
        else
          self.link
        end
      end
    end

    private

    def navigable_config(key)
      navigable.class.navigable_config[key]
    end
  end
end
