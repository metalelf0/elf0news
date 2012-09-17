class AddOriginalIdToNewsItems < ActiveRecord::Migration
  def change
    add_column :news_items, :original_id, :integer
  end
end
