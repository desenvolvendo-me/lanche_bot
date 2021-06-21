# frozen_string_literal: true

class CreateMenuJuices < ActiveRecord::Migration[6.0]
  def change
    create_table :menu_juices do |t|
      t.string :name
      t.string :cup_size
      t.string :price

      t.timestamps
    end
  end
end
