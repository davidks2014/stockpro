class ChangeUpdateDateColumnType < ActiveRecord::Migration[7.0]
  def change
    change_column :update_materials, :update_date, :datetime
  end
end
