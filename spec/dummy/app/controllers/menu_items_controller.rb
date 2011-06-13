class MenuItemsController < InheritedResources::Base
  has_widgets do |root|
    root << widget(:menu_editor)
  end

  def update
    update! do |success, failure|
      success.html {redirect_to menu_items_path}
    end
  end
end
