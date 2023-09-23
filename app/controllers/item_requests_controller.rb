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


end
