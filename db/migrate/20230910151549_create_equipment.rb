class CreateEquipment < ActiveRecord::Migration[7.0]
  def change
    create_table :equipment do |t|
      t.string :category
      t.string :name
      t.integer :qty
      t.references :location, null: false, foreign_key: true

      t.timestamps
    end
  end
end
