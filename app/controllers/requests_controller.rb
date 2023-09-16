class RequestsController < ApplicationController

  def new
    @materials = Material.all
    @equipment = Equipment.all
    @locations = Location.all
    respond_to do |format|
      format.html # Follow regular flow of Rails
      format.text { render partial: "requests/table", locals: {materials: @materials, equipment: @equipment}, formats: [:html] }
    end
    if params[:location_id].present?
      @materials = @materials.where(location_id: params[:location_id])
      @equipment = @equipment.where(location_id: params[:location_id])
    end
  end
end
