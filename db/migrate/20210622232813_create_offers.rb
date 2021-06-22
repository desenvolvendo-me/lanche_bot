class CreateOffers < ActiveRecord::Migration[6.0]
  def change
    create_table :offers do |t|
      t.decimal :price
      t.references :menu_juice, null: false, foreign_key: true
      t.references :menu_main, null: false, foreign_key: true

      t.timestamps
    end
  end
end
