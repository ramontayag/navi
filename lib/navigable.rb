require 'active_support'
require 'active_record'
require 'ordered_tree'
require "active_support/core_ext/module" # so we can use mattr_accessor
require 'navigable/navigation_item'
require 'navigable/instance_methods'
require 'navigable/renderers'

module Navigable
  def navigable(options={})
    cattr_accessor :navigable_config
    self.navigable_config = options
    has_one :nav_item, :as => :navigable
    include Navigable::InstanceMethods
  end

  # Renderer
  mattr_accessor :renderer
  @@renderer = Navigable::Renderers::SimpleNavigation
end

ActiveRecord::Base.extend Navigable
