class CreateMenuSodas < ActiveRecord::Migration[6.0]
  def change
    create_table :menu_sodas do |t|
      t.string :name
      t.string :type
      t.decimal :price

      t.timestamps
    end
  end
end
