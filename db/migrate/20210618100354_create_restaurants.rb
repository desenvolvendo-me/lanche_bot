class CreateRestaurants < ActiveRecord::Migration[6.0]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :address
      t.date :opening_time
      t.boolean :is_open

      t.timestamps
    end
  end
end
