class AddNumberToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :area_id, :integer
    add_reference :posts, :user, foreign_key: true
  end
end
