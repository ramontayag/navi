class MenuItemsController < ApplicationController
  has_widgets do |root|
    root << widget(:menu_editor)
  end

  def index
  end
end
