class FixFoodsColumns < ActiveRecord::Migration[7.0]
  def change
    rename_column :foods, :measument_unit, :measurement_unit
  end
end
