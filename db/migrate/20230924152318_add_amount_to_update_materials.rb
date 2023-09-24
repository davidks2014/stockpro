class AddAmountToUpdateMaterials < ActiveRecord::Migration[7.0]
  def change
    add_column :update_materials, :amount, :float
  end
end
