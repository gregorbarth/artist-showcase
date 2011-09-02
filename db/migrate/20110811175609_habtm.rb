class Habtm < ActiveRecord::Migration
  def self.up
    create_table :assets_pages, :id => false do |t|
      t.integer :asset_id
      t.integer :page_id

      t.timestamps
    end              
    
    create_table :categories_pages, :id => false do |t|
      t.integer :category_id
      t.integer :page_id

      t.timestamps
    end    
  end

  def self.down
    drop_table :assets_pages
    drop_table :categories_pages
  end
end
