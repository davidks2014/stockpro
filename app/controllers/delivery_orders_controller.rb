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
      location_id:,
      photos: delivery_order_params[:photos]
    )

    item_requests.each do |item_request|
      item_request.update(delivery_order_id: delivery_order.id)
    end

    if delivery_order.save
      redirect_to delivery_orders_path, notice: "Delivery order created"
    else
      render :del_approv_status, status: :unprocessable_entity
      # You may want to render a different view, depending on your application
    end
  end

  def receive
    @delivery_order = DeliveryOrder.find(params[:delivery_order_id])
    @delivery_order.update(delivery_status: 'Received')

    @delivery_order.item_requests.each do |item_request|
      outgoing_material_movement = MaterialMovement.create(
        qty: item_request.qty,
        location_id: item_request.request.location.id,
        material_id: item_request.item.id,
        unit_rate: item_request.item.unit_price,
        update_date: Time.now,
        remarks: "Outgoing Request Items",
        amount: (item_request.qty * item_request.item.unit_price).round(1)
      )

      item_request_qty = item_request.qty
      existing_qty = item_request.item.qty

      Material.find(item_request.item.id).update(
        unit_price: ((item_request.item.unit_price * existing_qty) - (item_request.item.unit_price * item_request_qty)) / (existing_qty - item_request_qty),
        qty: existing_qty - item_request_qty,
        amount: (existing_qty - item_request_qty) * item_request.item.unit_price,
        update_date: outgoing_material_movement.update_date
      )

      received_material_location = Location.find(item_request.request.original_location_id)
      received_material = Material.where(location: received_material_location, name: item_request.item.name).first

      incoming_material_movement = MaterialMovement.create(
        qty: item_request.qty,
        location_id: item_request.request.original_location_id,
        material_id: received_material.id,
        unit_rate: item_request.item.unit_price, # using the same unit rate as outgoing materials"
        update_date: Time.now,
        remarks: "Incoming Request Items",
        amount: (item_request.qty * item_request.item.unit_price).round(1)
      )

      Material.where(location_id: item_request.request.original_location_id, name: item_request.item.name).first.update(
        unit_price: ((received_material.unit_price * received_material.qty) + (item_request.item.unit_price * item_request_qty)) / (received_material.qty + item_request_qty),
        qty: received_material.qty + item_request_qty,
        amount: (received_material.qty * received_material.unit_price) + (item_request_qty * item_request.item.unit_price),
        update_date: incoming_material_movement.update_date
      )
    end
    redirect_to delivery_orders_path, notice: "Delivery order received"
  end

  def delivery_order_params
    params.require(:delivery_order).permit(:delivery_status, :location_id, photos: [])
  end
end
