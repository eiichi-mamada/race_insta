class CreateCars < ActiveRecord::Migration[5.2]
  def change
    create_table :cars do |t|
      t.integer :car_number
      t.string :name
      t.timestamps
    end
  end
end
