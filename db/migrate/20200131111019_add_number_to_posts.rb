class AddNumberToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :car_number, :string
    add_column :posts, :area_number, :string
    add_reference :posts, :user, foreign_key: true
  end
end
