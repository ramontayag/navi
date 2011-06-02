require 'active_support'
require 'active_support/core_ext/module/aliasing'
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
end

ActiveRecord::Base.extend Navigable
