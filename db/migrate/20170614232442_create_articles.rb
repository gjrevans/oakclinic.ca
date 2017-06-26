class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :body
      t.string :image
      t.string :user_id
      t.integer :status
      t.string :slug

      t.timestamps
    end    
  end
end
