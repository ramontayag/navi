class MenuEditor::TreeWidget < Apotomo::Widget
  def display
    @menu_items = MenuItem.scoped
    render
  end
end
