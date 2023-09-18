class AddOriginalLocationIdToRequests < ActiveRecord::Migration[7.0]
  def change
    add_column :requests, :original_location_id, :integer
  end
end
