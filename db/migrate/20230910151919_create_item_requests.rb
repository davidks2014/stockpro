class CreateItemRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :item_requests do |t|
      t.references :item, polymorphic: true
      t.references :request, null: false, foreign_key: true
      t.float :qty
      t.string :eng_appr_status
      t.string :man_appr_status

      t.timestamps
    end
  end
end
