class AddDiffToStockcounts < ActiveRecord::Migration[7.0]
  def change
    add_column :stockcounts, :diff, :float
  end
end
