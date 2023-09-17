class RequestsController < ApplicationController

  def new
    @materials = Material.all
    @equipment = Equipment.all
    @locations = Location.all

    if params[:location].present?
      #they will only find material = (location_id = 2)
      @materials = Material.where(location_id: params[:location])
      @equipment = Equipment.where(location_id: params[:location])
    end

    respond_to do |format|
      format.html #follow back the rails process
      format.text { render partial: "requests/table", locals: { materials: @materials, equipment: @equipment} }
    end
  end
end
