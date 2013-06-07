class MenuItemsController < ApplicationController
  has_widgets do |root|
    root << widget(:menu_editor)
  end

  respond_to :html

  def index
    @menu_items = MenuItem.scoped
    respond_with @menu_items
  end

  def update
    @menu_item = MenuItem.find(params[:id])
    @menu_item.update_attributes params[:menu_item]
    respond_with @menu_item, location: menu_items_path
  end
end
