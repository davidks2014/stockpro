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
      format.text { render partial: "requests/table", locals: { materials: @materials, equipment: @equipment}, formats: [:html]}
    end
  end

  def create
    pp 'zonghan'
    pp params
    data =  JSON.parse(params[:request])
    request["location_id"]
    @request = Request.create(location_id: data["location_id"], status: "pending")
    pp data["items"]
    item_requests = data["items"].map do |item|
      ItemRequest.create(item_type: item["item_type"], item_id: item["item_id"], qty: item["qty"], request_id: @request.id)
    end

    render json: {item_requests: item_requests, success: true}
  end

  private

  def request_params
    params.require(:request).permit(:location_id, :status)
  end
end
