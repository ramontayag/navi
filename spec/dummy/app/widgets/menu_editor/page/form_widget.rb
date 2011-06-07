class MenuEditor::Page::FormWidget < Apotomo::Widget
  responds_to_event :submit

  def display
    @pages = Page.scoped
    render
  end

  def submit(event)
    menu_item = MenuItem.create params[:page_menu_item]
    replace :state => :display
  end
end
