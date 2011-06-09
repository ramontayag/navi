class MenuEditor::TreeWidget < Apotomo::Widget
  responds_to_event :submit
  #responds_to_event :new_menu_item, :with => :add_item, :passing => :menu_editor
  responds_to_event :new_menu_item, :with => :add_item, :passing => :root
  include ActionController::RecordIdentifier
  include ActionView::Helpers::JavaScriptHelper
  include Rack::Utils

  def display
    @menu_items = ::MenuItem.roots
    render
  end

  def items(menu_items)
    @menu_items = menu_items
    render
  end

  def item(menu_item)
    @menu_item = menu_item
    render
  end

  def add_item(event)
    menu_item = event[:menu_item]
    # Have to escape_javascript here or else the browser won't render
    # it at all
    li = escape_javascript render({:state => :item}, menu_item)
    # We now tell the div#menu_item_tree's ul to add a new list item
    render :text => %Q($("##{widget_id} ol.sortable").append("#{li}");)
  end

  def submit
    params[:menu_item].each do |key, value|
      menu_item_id = key.gsub("menu_item_", "").to_i
      menu_item = MenuItem.find menu_item_id
      position = value[:position].to_i + 1
      parent_id = value[:parent_id] == "root" ? 0 : value[:parent_id]
      if menu_item.update_attributes(:position => position, :parent_id => parent_id)
        ::Rails.logger.info "Updated menu_item##{menu_item.label} to #{{:position => position, :parent_id => parent_id}.inspect}"
      else
        ::Rails.logger.info "There was an error"
      end
    end

    render :text => %Q(alert("Saved!"));
  end
end
