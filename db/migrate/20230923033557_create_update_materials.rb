class CreateUpdateMaterials < ActiveRecord::Migration[7.0]
  def change
    create_table :update_materials do |t|
      t.string :unit_rate
      t.string :float
      t.string :update_date
      t.string :date
      t.string :location
      t.string :references
      t.string :material
      t.string :references

      t.timestamps
    end
  end
end
