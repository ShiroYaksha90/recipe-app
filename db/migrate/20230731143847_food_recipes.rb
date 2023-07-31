class FoodRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :food_recipes do |t|
     t.integer :quantity
      t.references :food, null: false, foreign_key: true, index: true
      t.references :recipe, null: false, foreign_key: true, index: true
      t.timestamps
  end
end
end