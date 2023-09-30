class AddStockalertToMaterials < ActiveRecord::Migration[7.0]
  def change
    add_column :materials, :alertlevel, :float
  end
end
