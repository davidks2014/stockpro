class ItemRequestsController < ApplicationController

  def eng_approve
    @item_request = ItemRequest.find(params[:item_request_id])
    @item_request.update(eng_appr_status: 'approved')
    redirect_to requests_path, notice: "Engineer approved item for delivery"
  end

  def eng_decline
    @item_request = ItemRequest.find(params[:item_request_id])
    @item_request.update(eng_appr_status: 'declined')
    @item_request.update(del_approv_status: "Declined")
    redirect_to requests_path, notice: "Engineer declined item for delivery"
  end

  def man_approve

    @item_request = ItemRequest.find(params[:item_request_id])
    @item_request.update(man_appr_status: 'approved')

    if (@item_request.eng_appr_status == 'approved') && (@item_request.man_appr_status == 'approved')
      @item_request.update(del_approv_status: "Approved")
    end

    redirect_to requests_path, notice: "Manager approved item for delivery #{del_approv_status}"
  end

  def man_decline
    @item_request = ItemRequest.find(params[:item_request_id])
    @item_request.update(man_appr_status: 'declined')

    @item_request.update(del_approv_status: "Declined")

    redirect_to requests_path, notice: "Manager declined item for delivery"
  end

  def del_approv_status
    @item_requests = ItemRequest.where(del_approv_status: params[:del_approv_status])
    @delivery_order = DeliveryOrder.new
  end

  def approval
    @item_requests = ItemRequest.all
    @location = Location.find(params[:location_id])

    if (current_user.location_id == @location.id || current_user.role == "manager")
      @requests_made_to_others = @item_requests.select { |item_request| Location.find(item_request.request.original_location_id) == @location }

      @requests_made_from_others = @item_requests.select { |item_request| Location.find(item_request.request.location_id) == @location }
    end
    
  end


end
