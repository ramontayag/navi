require 'navi/navigator/class_methods'
require 'navi/navigator/instance_methods'

module Navi
  module Navigator
    class Base < ActiveRecord::Base
      include Navi::Navigator::ClassMethods
      include Navi::Navigator::InstanceMethods
    end
  end
end
