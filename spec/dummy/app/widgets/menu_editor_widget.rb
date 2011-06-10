class MenuEditorWidget < Apotomo::Widget
  has_widgets do |root|
    root << widget("menu_editor/page/form", :menu_item_page_form)
    root << widget("menu_editor/category/form", :menu_item_category_form)
    root << widget("menu_editor/tree", :menu_item_tree)
  end

  def display
    render
  end
end
