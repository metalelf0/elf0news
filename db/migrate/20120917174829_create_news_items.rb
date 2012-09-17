class CreateNewsItems < ActiveRecord::Migration
  def self.up
    create_table :news_items do |t|
      t.integer :score
      t.string :title
      t.string :url
      t.integer :points
      t.timestamps
    end
  end

  def self.down
    drop_table :news_items
  end
end
