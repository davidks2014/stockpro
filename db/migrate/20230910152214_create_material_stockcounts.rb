class CreateMaterialStockcounts < ActiveRecord::Migration[7.0]
  def change
    create_table :material_stockcounts do |t|
      t.string :category
      t.string :name
      t.string :cost_code
      t.float :unit_price
      t.float :qty
      t.string :uom
      t.references :location, null: false, foreign_key: true

      t.timestamps
    end
  end
end
