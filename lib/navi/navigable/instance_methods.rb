module Navi
  module Navigable
    module InstanceMethods
      def to_navigator(options={})
        return navigator_instance if navigator_instance
        options.merge!(:navigable => self)
        Navi.navigator_class.new options
      end

      private

      # Easily get the navigator instance based on the Navi.navigator setting
      def navigator_instance
        @navigator_instance ||= send(Navi.navigator)
      end
    end
  end
end
