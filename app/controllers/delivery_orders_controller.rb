class DeliveryOrdersController < ApplicationController
  def index

  end

  def create
    raise
    # First, retrieve the location_id and item_request_ids from the form params
    location_id = params[:delivery_order][:location_id]
    item_request_ids = params[:delivery_order][:item_request_ids]

    # You can then use these parameters to create a new delivery order
    delivery_order = DeliveryOrder.new(location_id: location_id)

    # Assuming you have a DeliveryOrderItem model to associate items with the delivery order
    item_request_ids.each do |item_request_id|
      item_request = ItemRequest.find(item_request_id)
      delivery_order.delivery_order_items.build(item_request: item_request)
    end

    if delivery_order.save
      # Handle successful creation (e.g., redirect to a success page)
      flash[:notice] = "Delivery order created successfully."
      redirect_to delivery_order_path(delivery_order)
    else
      # Handle validation errors or other failures (e.g., render the form again with errors)
      flash[:alert] = "Failed to create a delivery order."
      render :del_approv_status # Assuming you have a new.html.erb template for creating delivery orders
    end
  end
end
