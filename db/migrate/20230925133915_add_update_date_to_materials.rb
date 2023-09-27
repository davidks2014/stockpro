class AddUpdateDateToMaterials < ActiveRecord::Migration[7.0]
  def change
    add_column :materials, :update_date, :datetime
  end
end
