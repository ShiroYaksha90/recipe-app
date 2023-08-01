# frozen_string_literal: true

class Foods < ActiveRecord::Migration[7.0]
  def change
    create_table :foods do |t|
      t.string :name
      t.string :measument_unit
      t.string :price
      t.integer :quantity
      t.references :user, null: false, foreign_key: true, index: true
      t.timestamps
    end
  end
end
