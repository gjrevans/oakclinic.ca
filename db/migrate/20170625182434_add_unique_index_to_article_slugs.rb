class AddUniqueIndexToArticleSlugs < ActiveRecord::Migration[5.0]
  def change
      add_index :articles, :slug, unique: true
  end
end
