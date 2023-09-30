class RequestsController < ApplicationController

  def index
    @requests = Request.all
  end

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

  def show
    @request = Request.find(params[:id])
  end


  def create
    data = JSON.parse(params[:data]) #this must same with the stimulus body append
    @request = Request.new(
      location_id: data["location_id"],
      status: "pending",
      user_id: current_user.id,
      original_location_id: current_user.location_id
    )

    if @request.save
      item_requests = []
      # change something
      # more changes

      data["items"].each do |item|
        item_request = ItemRequest.create(
          item_type: item["item_type"],
          item_id: item["item_id"],
          qty: item["qty"],
          request: @request,
          del_approv_status: "Pending engineer approval"
        )

        item_requests << item_request
      end

      render json: { item_requests:, request_id: @request.id }, status: :ok
    else
      render json: { errors: @request.errors.full_messages }, status: :unprocessable_entity
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
