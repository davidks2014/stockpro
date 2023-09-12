class AddReferencesToUser < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :location, null: true, foreign_key: true
  end
end
