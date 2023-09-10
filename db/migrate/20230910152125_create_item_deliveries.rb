class CreateItemDeliveries < ActiveRecord::Migration[7.0]
  def change
    create_table :item_deliveries do |t|
      t.string :status
      t.string :qty
      t.references :item_request, null: false, foreign_key: true

      t.timestamps
    end
  end
end
