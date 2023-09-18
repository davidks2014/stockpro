class ItemRequestsController < ApplicationController

  def eng_approve
    @item_request = ItemRequest.find(params[:item_request_id])
    @item_request.update(eng_appr_status: 'Item approved')
    redirect_to requests_path, notice: "Engineer approved item for delivery"
  end

  def eng_decline
    @item_request = ItemRequest.find(params[:item_request_id])
    @item_request.update(eng_appr_status: 'Item declined')
    redirect_to requests_path, notice: "Engineer declined item for delivery"
  end

  def man_approve
    @item_request = ItemRequest.find(params[:item_request_id])
    @item_request.update(man_appr_status: 'Item approved')
    redirect_to requests_path, notice: "Manager approved item for delivery"
  end

  def man_decline
    @item_request = ItemRequest.find(params[:item_request_id])
    @item_request.update(man_appr_status: 'Item declined')
    redirect_to requests_path, notice: "Manager declined item for delivery"
  end

  def del_appr_status
    @item_requests = ItemRequest.where(del_appr_status: params[:del_appr_status])
  end


end
