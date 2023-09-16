class RequestsController < ApplicationController

  def new
    @materials = Material.all
    @equipment = Equipment.all
    @locations = Location.all
  end
end
