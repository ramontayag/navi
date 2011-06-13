class MenuEditor::Category::FormWidget < Apotomo::Widget
  responds_to_event :submit

  def display
    @categories = ::Category.scoped
    render
  end

  def submit(event)
    @menu_item = MenuItem.new params[:menu_item]
    if @menu_item.save
      trigger :new_menu_item, :menu_item => @menu_item
      replace :state => :display
    else
      replace :view => :display
    end
  end
end
