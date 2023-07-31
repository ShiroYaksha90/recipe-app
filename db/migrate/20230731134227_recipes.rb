class Recipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :prepration_time
      t.string :cooking_time
      t.text :description
      t.boolean :public
      t.references :user, null: false, foreign_key: true, index: true
      t.timestamps
    end
  end
end
