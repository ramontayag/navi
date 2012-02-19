module Navi
  module Navigable
    module InstanceMethods
      def to_navigator(options={})
        return navigator_instance if navigator_instance
        options.merge!(:navigable => self)
        Navi.navigator_class.new options
      end

      def to_navigator!(options={})
        navigator = to_navigator(options)
        navigator.save
        navigator
      end

      private

      # Easily get the navigator instance based on the Navi.navigator setting
      # Uses own finder because upon destroy the polymorphic association seemed
      # to break.
      def navigator_instance
        @navigator_instance ||= Navi.navigator.to_s.classify.constantize.where(
          :navigable_id   => self.id,
          :navigable_type => self.class.name
        ).first
      end

      def prepare_standalone_navigator!
        if navigator_instance
          set_navigator_label_to_self!
          set_navigator_url_to_hash!
          nullify_navigator_pointer_to_self!
        end
      end

      def set_navigator_label_to_self!
        navigator_instance.label = navigator_instance.label
      end

      def set_navigator_url_to_hash!
        navigator_instance.url = "#"
      end

      def nullify_navigator_pointer_to_self!
        navigator_instance.update_attributes(
          :navigable_id   => nil,
          :navigable_type => nil
        )
      end
    end
  end
end
