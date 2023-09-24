class CreateMaterialMovements < ActiveRecord::Migration[7.0]
  def change
    create_table :material_movements do |t|
      t.float :unit_rate
      t.float :qty
      t.datetime :update_date
      t.references :location, null: false, foreign_key: true
      t.references :material, null: false, foreign_key: true

      t.timestamps
    end
  end
end
