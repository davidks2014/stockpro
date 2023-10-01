class LocationsController < ApplicationController

  def index
    @locations = Location.all
  end

  def new
    @location = Location.new
    @new_user = User.where(location_id: nil, role: "engineer")
  end

  def create
    @raise
    @location = Location.new(location_params)
    if @location.save
      redirect_to locations_path
    else
      render :new
    end
  end

  def show
    @location = Location.includes(:users).find(params[:id])
  end

  def stockcount_report
    @location = Location.find(params[:location_id])
  end

  def show_low_stock

    @location = Location.find(params[:location_id])
    @materials = Material.all
    if current_user.role == "engineer"
      @low_stock_materials = @materials.select{|material| (material.qty < material.alertlevel && material.location == current_user.location)}
    elsif current_user.role == "manager"
      @low_stock_materials = @materials.select{|material| material.qty < material.alertlevel}
    end

  end

  private

  def location_params
    params.require(:location).permit(:name, :address, user_ids: [])
  end

end
