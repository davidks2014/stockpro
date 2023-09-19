class DeliveryOrdersController < ApplicationController
  def index
    @delivery_orders = DeliveryOrder.all
  end
  def create
    selected_item_request_ids = params[:selected_item_request_ids]

    if selected_item_request_ids.empty?
      redirect_to del_approv_status_path, alert: "No item requests selected for delivery"
      return
    end

    location_id = nil
    item_requests = []
    delivery_order.item_requests = item_requests

    ActiveRecord::Base.transaction do
      selected_item_request_ids.each do |item_request_id|
        item_request = ItemRequest.find(item_request_id)
        item_requests << item_request
        location = Location.find(item_request.request.original_location_id)

        # Check if location is valid before assigning it to location_id
        if location.present?
          location_id = location.id
          # You can perform additional logic here if needed
        else
          # Handle the case where a location is not found (e.g., log an error or provide user feedback)
        end
      end

      if location_id.present?
        delivery_order = DeliveryOrder.new(
          delivery_status: "Delivering",
          location_id: location_id,
          # Add other attributes as needed
        )

        if delivery_order.save
          item_requests.each do |item_request|
            item_request.update(delivery_order_id: delivery_order.id)
          end

          redirect_to delivery_orders_path, notice: "Delivery order created"
        else
          render :del_approv_status, status: :unprocessable_entity
          # You may want to render a different view, depending on your application
        end
      else
        # Handle the case where no valid location is found for any selected item requests
        # You can log an error or provide user feedback
        redirect_to requests_path, alert: "No valid location found for selected item requests"
      end
    end
  end
end
