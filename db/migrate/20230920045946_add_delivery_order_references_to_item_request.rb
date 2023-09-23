class AddDeliveryOrderReferencesToItemRequest < ActiveRecord::Migration[7.0]
  def change
    add_reference :item_requests, :delivery_order, foreign_key: true, null: true
  end
end
