require 'time'

class UpdateMaterialsController < ApplicationController

  def index
    @update_materials = UpdateMaterial.all
  end

  def new
    @update_material = UpdateMaterial.new
  end

  def show
    @location = Location.find(params[:location_id])

  end

  def update
    @location = Location.find(params[:location_id])
    @location.materials.each do |material|
      @update_material = UpdateMaterial.new
      @update_material = UpdateMaterial.create!(
      update_date: Time.now,
      location: @location,
      material: material,
      qty: material.qty,
      amount: material.amount,
      unit_rate: (material.amount/material.qty).round(2)
      )

      Material.find(material.id).update(unit_price: @update_material.unit_rate)
      Material.find(material.id).update(update_date: @update_material.update_date)
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

    @material_movements
    redirect_to location_path(@material_movements.last.location_id)
  end

  def record_movement
    @material_movements.each do |movement|
      material = Material.find(movement.material_id)
      if movement.remarks == "Project Usage"
        material.update(unit_price: movement.unit_rate)
        material.update(qty: material.qty - movement.qty, amount: material.amount - movement.unit_rate * movement.qty)

      elsif movement.remarks == "Import New Materials"
        material.update(unit_price: (movement.unit_rate*movement.qty + material.unit_price*material.qty)/(movement.qty+material.qty))
        material.update(qty: material.qty + movement.qty, amount: material.amount + movement.unit_rate * movement.qty)

      end
    end
  end

  def stockcount
    @location = Location.find(params[:location_id])
    @remarks = params[:remarks]

    stockcounts = []
    @location.materials.each do |material|
      stockcounts << Stockcount.new
    end
  end

  def stockcount_update
    @stockcounts = Stockcount.create(stockcount_params)

    @stockcounts.each do |stock|
      stock.update(diff: stock.qty - Material.find(stock.material_id).qty)
      # if stock.diff > 0
      #   MaterialMovement.find(stock.material.id).update(qty: stock.diff, remarks: "Stockcount(excess)", update_date: stock.update_date, unit_rate: stock.unit_rate)
      # elsif stock.diff < 0
      #   MaterialMovement.find(stock.material.id).update(qty: stock.diff, remarks: "Stockcount(shorfall)", update_date: stock.update_date, unit_rate: stock.unit_rate)
      # end

      MaterialMovement.create!(
          qty: stock.diff.abs,
          remarks: (stock.diff > 0) ? "Stockcount(excess)" : (stock.diff < 0) ? "Stockcount(shortfall)" : "Stockcount(even)",
          unit_rate: stock.unit_rate,
          location_id: stock.location_id,
          material_id: stock.material_id,
          update_date: stock.update_date
        )

      #Material.find(stock.material_id).update(qty: stock.qty)
    end

    redirect_to stockcount_report_path

  end

  def updatestock

    @location = Location.find(params[:location_id])
    @location.materials.each do |material|
      Material.find(material.id).update(qty: material.stockcounts.last.qty)

    #   MaterialMovement.create!(
    #       qty: material.stockcounts.last.diff,
    #       remarks: "Stockcount",
    #       unit_rate: material.stockcounts.last.unit_rate,
    #       location_id: material.stockcounts.last.location_id,
    #       material_id: material.stockcounts.last.material_id,
    #       update_date: material.stockcounts.last.update_date
    #     )
    end

    redirect_to location_path(@location)
  end

  def stockalert
    @location = Location.find(params[:location_id])
  end

  def stockalert_update

    # Iterate over the submitted parameters
    params[:materials].each do |material_params|
      # Find the Material record based on the material ID
      material = Material.find(material_params[:id])

      # Update the alertlevel attribute with the submitted value
      material.update(alertlevel: material_params[:alertlevel])
    end

    @location = Location.find(params[:location_id])
    redirect_to location_path(@location)
    # ...
  end



end


  private

  def material_movement_params
    params.require(:material_movements).map do |movement_params|
      movement_params.permit(:qty, :location_id, :material_id, :update_date, :remarks, :unit_rate, :amount)
    end
  end

  def stockcount_params
    params.require(:stockcounts).map do |stock_params|
      stock_params.permit(:qty, :location_id, :material_id, :update_date, :unit_rate, :amount)
    end
  end
