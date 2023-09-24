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
    @materials = @location.materials
    @update_material = UpdateMaterial.new
  end


end
