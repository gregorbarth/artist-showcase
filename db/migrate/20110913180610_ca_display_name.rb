class CaDisplayName < ActiveRecord::Migration
  def up
    add_column :content_areas, :display_name, :string
  end

  def down
    remove_column :content_areas, :display_name
  end
end
