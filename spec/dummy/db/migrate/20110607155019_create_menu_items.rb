class CreateMenuItems < ActiveRecord::Migration
  def self.up
    create_table(:nav_items) do |t|
      t.string :label
      t.string :link
      t.string :title
      t.integer :parent_id
      t.integer :position
      t.string :highlights_on
      t.integer :navigable_id
      t.string :navigable_type
      t.timestamps
    end
  end

  def self.down
    drop_table(:nav_items)
  end
end
