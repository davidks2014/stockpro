class AddAmountToMaterialMovements < ActiveRecord::Migration[7.0]
  def change
    add_column :material_movements, :amount, :float
  end
end
