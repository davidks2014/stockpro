class AddImageToMaterial < ActiveRecord::Migration[7.0]
  def change
    add_column :materials, :image_path, :string
  end
end
