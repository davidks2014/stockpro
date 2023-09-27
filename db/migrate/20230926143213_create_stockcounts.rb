class CreateStockcounts < ActiveRecord::Migration[7.0]
  def change
    create_table :stockcounts do |t|
      t.datetime :update_date
      t.float :qty
      t.references :location, null: false, foreign_key: true
      t.references :material, null: false, foreign_key: true
      t.float :unit_rate
      t.float :amount

      t.timestamps
    end
  end
end
