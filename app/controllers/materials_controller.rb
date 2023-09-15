class MaterialsController < ApplicationController


  def index
    @materials = Material.all
  end

  def import
    require 'roo'

    if params[:material].nil? || params[:material][:file].nil?
      render import_path, alert: "Please select a file to import."

    else
      file = params[:material][:file]
      spreadsheet = Roo::Spreadsheet.open(file.path)
      header = spreadsheet.row(1)

      (2..spreadsheet.last_row).each do |i|
        row = Hash[[header, spreadsheet.row(i)].transpose]
        material = Material.new(row)
        material.save
      end

      redirect_to materials_path, notice: "Materials imported successfully."
    end
  end

  private

  def material_params
    # params.require(:material).permit(:name, :category, :cost_code, :unit_price, :qty, :uom, :location_id)
  end



end
