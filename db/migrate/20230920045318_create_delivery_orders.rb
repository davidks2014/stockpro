class CreateDeliveryOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :delivery_orders do |t|
      t.string :delivery_status
      t.references :location, null: false, foreign_key: true

      t.timestamps
    end
  end
end
