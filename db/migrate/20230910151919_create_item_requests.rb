class CreateItemRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :item_requests do |t|
      t.references :material, null: true, foreign_key: true
      t.references :equipment, null: true, foreign_key: true
      t.references :request, null: false, foreign_key: true
      t.float :qty

      t.timestamps
    end
  end
end
