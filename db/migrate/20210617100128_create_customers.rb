# frozen_string_literal: true

# migrations to customer
class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :phone

      t.timestamps
    end
  end
end
