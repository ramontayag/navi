class MenuItemsController < ApplicationController
  has_widgets do |root|
    root << widget(:page_menu_item_form)
    root << widget(:category_menu_item_form)
  end

  def index
  end
end
