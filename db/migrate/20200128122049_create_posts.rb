class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.text :image, null: false
      t.text :text 
      # t.references :user, foreign_key: true
      # t.references :area, foreign_key: true
      # t.references :car, foreign_key: true
      t.timestamps
    end
  end
end
