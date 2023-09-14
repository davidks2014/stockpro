class ItemRequestsController < ApplicationController
  def create
    @item_request = ItemRequest.new(item_request_params)
    raise
  end

  private
  def item_request_params
    params.require(:item_request).permit(:item_type, :item_id, :qty)
  end
end
