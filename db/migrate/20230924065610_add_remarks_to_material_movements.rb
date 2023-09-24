class AddRemarksToMaterialMovements < ActiveRecord::Migration[7.0]
  def change
    add_column :material_movements, :remarks, :string
  end
end
``
