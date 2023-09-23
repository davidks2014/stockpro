class UpdateMaterialsController < ApplicationController

  def index
    @update_materials = UpdateMaterial.all
  end

  def new
    @update_material = UpdateMaterial.new
  end

  

end
