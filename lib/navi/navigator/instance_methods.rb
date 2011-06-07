module Navi
  module Navigator
    module InstanceMethods
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
          return case config
        when Symbol then navigable.send config
        when String then config
        when Proc then config.call navigable
        end
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
                  case config
                  when Proc then config.call navigable
                  else config
                  end
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
end
