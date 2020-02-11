class CreateNumberTags < ActiveRecord::Migration[5.2]
  def change
    create_table :number_tags do |t|
      t.references :post, foreign_key: true
      t.references :car, foreign_key: true
      t.timestamps
    end
  end
end
