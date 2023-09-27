class AddAmountToMaterials < ActiveRecord::Migration[7.0]
  def change
    add_column :materials, :amount, :float
  end
end
