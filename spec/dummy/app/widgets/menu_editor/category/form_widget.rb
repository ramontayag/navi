class MenuEditor::Category::FormWidget < Apotomo::Widget
  responds_to_event :submit

  def display
    #@categories = Category.scoped
    render
  end

  def submit(event)
    menu_item = MenuItem.create params[:category_menu_item]
    replace :state => :display
  end
end
