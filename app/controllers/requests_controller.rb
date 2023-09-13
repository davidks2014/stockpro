class RequestsController < ApplicationController

  def new
    @materials = Material.all
    @equipment = Equipment.all
  end
end
