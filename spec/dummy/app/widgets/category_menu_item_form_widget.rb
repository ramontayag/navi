class CategoryMenuItemFormWidget < Apotomo::Widget
  def display
    @categories = Category.scoped
    render
  end
end
