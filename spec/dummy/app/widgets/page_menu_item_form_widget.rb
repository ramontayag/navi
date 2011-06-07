class PageMenuItemFormWidget < Apotomo::Widget
  responds_to_event :submit

  def display
    @pages = Page.scoped
    render
  end
end
