class AddDelApprovStatusToItemRequest < ActiveRecord::Migration[7.0]
  def change
    add_column :item_requests, :del_approv_status, :string
  end
end
