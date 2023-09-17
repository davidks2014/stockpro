class ItemRequestsController < ApplicationController

  def approve
    @item_request = ItemRequest.find(params[:item_request_id])
    @item_request.update(eng_appr_status: 'Item approved')
    redirect_to requests_path, notice: "Item approved successfully"
  end

  def decline
    @item_request = ItemRequest.find(params[:item_request_id])
    @item_request.update(eng_appr_status: 'Item decline')
    redirect_to requests_path, notice: "Item decline successfully"
  end
end
