class RequestsController < ApplicationController

  def new
    @materials = Material.all
    @equipment = Equipment.all
    @locations = Location.all

    if params[:location].present?
      @materials = @materials.where(location_id: params[:location])
      @equipment = @equipment.where(location_id: params[:location])
    end

    respond_to do |format|
      format.html # Follow regular flow of Rails
      format.text { render partial: "requests/table", locals: {materials: @materials, equipment: @equipment}, formats: [:html] }
    end

  end
end
