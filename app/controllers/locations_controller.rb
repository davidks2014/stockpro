class LocationsController < ApplicationController

  def index
    @locations = Location.all
  end

  def new
    @location = Location.new
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

 

  private

  def location_params
    params.require(:location).permit(:name, :address, user_ids: [])
  end

end
