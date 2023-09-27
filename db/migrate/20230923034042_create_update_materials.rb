class CreateUpdateMaterials < ActiveRecord::Migration[7.0]
  def change
    create_table :update_materials do |t|
      t.float :unit_rate

      t.date :update_date
      t.references :location, null: false, foreign_key: true
      t.references :material, null: false, foreign_key: true

      t.timestamps
    end
  end
end
