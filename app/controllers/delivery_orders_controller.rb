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

    redirect_to delivery_orders_path, notice: "Delivery order received"

    #now we need to update the qty in location

    sent_location = @delivery_order.item_requests.first.request.location
    #sent location
    received_location =Location.find(@delivery_order.item_requests.first.request.original_location_id)
    #received location

    outgoing_material_movements = []
    @delivery_order.item_requests.each do |material|
      outgoing_material_movements << MaterialMovement.new
    end

    @delivery_order.item_requests.each do |item_request|
      outgoing_material_movement = MaterialMovement.create(
        qty: item_request.qty,
        location_id: item_request.request.location.id,
        material_id: item_request.item.id,
        unit_rate: item_request.item.unit_price,
        update_date: Time.now,
        remarks: "Outgoing Request Items"
      )
    end

    incoming_material_movements = []
    @delivery_order.item_requests.each do |material|
      incoming_material_movements << MaterialMovement.new
    end

    @delivery_order.item_requests.each do |item_request|
      incoming_material_movement = MaterialMovement.create(
        qty: item_request.qty,
        location_id: item_request.request.original_location_id,
        material_id: item_request.item.id,
        unit_rate: item_request.item.unit_price,
        update_date: Time.now,
        remarks: "Incoming Request Items"
      )
    end





    # @delivery_order.item_requests.each do |item_request|
    #   item_request_qty = item_request.qty
    #   existing_qty = item_request.item.qty
    #   sent_material_location = item_request.item.location
    #   received_material_location = Location.find(item_request.request.original_location_id)

    #   updated_project_material = Material.where(location: received_material_location, name: item_request.item.name).first

    #   updated_warehouse = item_request.item.update(qty: existing_qty - item_request_qty)
    #   updated_project_material.update(qty: updated_project_material.qty + item_request_qty)
    # end
  end

end
