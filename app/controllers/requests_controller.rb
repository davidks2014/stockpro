class RequestsController < ApplicationController

  def new
    @materials = []
    @equipment = []
    @locations = Location.all
    @request = Request.new
    @item_request = ItemRequest.new
    if params[:location].present?
      @materials = Material.where(location_id: params[:location])
      @equipment = Equipment.where(location_id: params[:location])
    end
    respond_to do |format|
      format.html # Follow regular flow of Rails
      format.text { render partial: "requests/table", locals: {materials: @materials, equipment: @equipment}, formats: [:html] }
    end
  end

  def create
    @request = Request.new(request_params)

    if @request.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def request_params
    params.require(:request).permit(:location_id, :status)
  end
  def item_request_params
    params.require(:item_request).permit(:item_type, :item_id, :qty)
  end
end
