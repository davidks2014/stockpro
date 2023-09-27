class AddQtyToUpdateMaterials < ActiveRecord::Migration[7.0]
  def change
    add_column :update_materials, :qty, :float
  end
end
