class CreateMenuItems < ActiveRecord::Migration
  def self.up
    create_table(:menu_items) do |t|
      t.string :label
      t.string :link
      t.string :title
      t.integer :parent_id, :default => 0
      t.integer :position
      t.string :highlights_on
      t.integer :navigable_id
      t.string :navigable_type
      t.timestamps
    end
  end

  def self.down
    drop_table(:menu_items)
  end
end
