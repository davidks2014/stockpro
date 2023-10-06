class LocationsController < ApplicationController

  def index
    @locations = Location.all
  end

  def new
    @location = Location.new
    @new_user = User.where(location_id: nil, role: "engineer")
  end

  def create
    qty = 0
    unit_price= 0
    graniteblock = {
      category: "block",
      name: "granite block - 20x20x10 cm",
      cost_code: "bgb-202010",
      unit_price: unit_price,
      qty:,
      amount: qty * unit_price,
      uom: "pcs",
      image_path: "granite_block.jpeg",
      location:,
      alertlevel: 0
    }

    hollowcoreblock = {category: "  block", name: "hollow core block - 39x10x19 cm", cost_code: "bhc-301019", unit_price: unit_price, qty: qty, amount: qty * unit_price, uom: "pcs", image_path: "hollow_core_block.jpeg", location:, alertlevel: 0}

    redbrick = {category: "block", name: "red brick - 20x10x9 cm", cost_code: "brb-201009", unit_price: unit_price, qty: qty, amount: qty * unit_price, uom: "pcs", image_path: "red_brick.jpg", location:, alertlevel: 0}

    riversand = {category: "sand", name: "river sand (10kg)", cost_code: "srs-001", unit_price: unit_price, qty: qty, amount: qty * unit_price, uom: "bag", image_path: "sand.jpeg", location:, alertlevel: 0}

    portlandcement = {category: "cement", name: "portland cement (50kg)", cost_code: "cpc-50", unit_price: unit_price, qty: qty, amount: qty * unit_price, uom: "bag", image_path: "portland_cement.jpg", location:, alertlevel: 0}

    t10 = {category: "rebar", name: "10mm dia. rebar", cost_code: "T10", unit_price: unit_price, qty: qty, amount: qty * unit_price, uom: "tons", image_path: "T10_rebar.jpg", location:, alertlevel: 0}

    t12 = {category: "rebar", name: "12mm dia. rebar", cost_code: "T12", unit_price: unit_price, qty: qty, amount: qty * unit_price, uom: "tons", image_path: "T12_rebar.jpg", location:, alertlevel: 0}

    t16 = {category: "rebar", name: "16mm dia. rebar", cost_code: "T16", unit_price: unit_price, qty: qty, amount: qty * unit_price, uom: "tons", image_path: "T16_rebar.jpg", location:, alertlevel: 0}


    @materials = [graniteblock, hollowcoreblock, redbrick, riversand, portlandcement, t10, t12, t16]
    @location = Location.create!(location_params)
    if @location.save
      @materials.each do |material|
        material[:location] = @location
        @location.materials.create!(material)
      end
      redirect_to locations_path
    else
      render :new
    end
  end

  def show
    @location = Location.includes(:users).find(params[:id])
  end

  def stockcount_report
    @location = Location.find(params[:location_id])
  end

  def show_low_stock

    @location = Location.find(params[:location_id])
    @materials = Material.all
    if current_user.role == "engineer"
      @low_stock_materials = @materials.select{|material| (material.qty < material.alertlevel && material.location == current_user.location)}
    elsif current_user.role == "manager"
      @low_stock_materials = @materials.select{|material| material.qty < material.alertlevel}
    end

  end

  private

  def location_params
    params.require(:location).permit(:name, :address, user_ids: [])
  end

end
