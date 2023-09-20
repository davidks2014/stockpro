class DeliveryOrdersController < ApplicationController
  def index
    @delivery_orders = DeliveryOrder.all
  end

  def create
    selected_item_request_ids = params[:selected_item_request_ids]
    item_requests = []

    selected_item_request_ids.each do |item_request_id|
      item_request = ItemRequest.find(item_request_id)
      item_requests << item_request
    end


    location_id = Location.find(item_requests.first.request.original_location_id).id
    delivery_order = DeliveryOrder.create(
        delivery_status: "Delivering",
        location_id: location_id
      )
    item_requests.each do |item_request|
      item_request.update(delivery_order_id: delivery_order.id)
    end

    if delivery_order.persisted?
      redirect_to delivery_orders_path, notice: "Delivery order created"
    else
      render :del_approv_status, status: :unprocessable_entity
      # You may want to render a different view, depending on your application
    end
  end
end
