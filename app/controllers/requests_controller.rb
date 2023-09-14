class RequestsController < ApplicationController

  def new
    @materials = Material.all
    @equipment = Equipment.all
    @item_request = ItemRequest.new
  end
end
