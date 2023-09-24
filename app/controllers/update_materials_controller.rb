require 'time'

class UpdateMaterialsController < ApplicationController

  def index
    @update_materials = UpdateMaterial.all
  end

  def new
    @update_material = UpdateMaterial.new
  end

  def update
    @location = Location.find(params[:location_id])
    @location.materials.each do |material|
      @update_material = UpdateMaterial.new
      @update_material = UpdateMaterial.create!(
      update_date: Time.now,
      location: @location,
      unit_rate: material.unit_price,
      material: material,
      qty: material.qty)
    end
  end

  def material_usage
    @location = Location.find(params[:location_id])
    @remarks = params[:remarks]

    material_movements = []
    @location.materials.each do |material|
      material_movements << MaterialMovement.new
    end
  end

  # In your controller action for form submission
  def create
    @material_movements = MaterialMovement.create(material_movement_params)
    # Handle success or failure
    # Redirect or render appropriate view

    record_movement
  end


  def record_movement
    @material_movements.each do |movement|
      material = Material.find(movement.material_id)
      if movement.remarks == "Project Usage"
        material.update(qty: material.qty - movement.qty)
      elsif movement.remarks == "Import New Materials"
        material.update(qty: material.qty + movement.qty)
      end
    end
  end
end

  private

  def material_movement_params
    params.require(:material_movements).map do |movement_params|
      movement_params.permit(:qty, :location_id, :material_id, :update_date, :remarks, :unit_rate)
    end
  end
