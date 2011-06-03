require 'active_support'
require 'active_record'
require 'navigable/navigation_item'
require 'navigable/instance_methods'

module Navigable
  def navigable(options={})
    cattr_accessor :navigable_config
    self.navigable_config = options
    has_one :navigation_item, :as => :navigable
    include Navigable::InstanceMethods
  end

  # Renderer
  mattr_accessor :renderer
  @@renderer = Navigable::Renderers::SimpleNavigation
end

ActiveRecord::Base.extend Navigable
