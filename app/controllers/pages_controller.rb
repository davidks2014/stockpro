class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @sites = Site.geocoded
    @requests = Request.all
    @item_request = ItemRequest.where(del_approv_status: "Pending")
    @item_request_count = 0
    @item_request_manager_count = 0
    @received_requests = @requests.each do |request|
      @item_request_count += request.item_requests.select { |item_request| item_request.eng_appr_status == nil && item_request.request.location_id == current_user.id }.count
      @item_request_manager_count += request.item_requests.select { |item_request| item_request.eng_appr_status == 'approved' && item_request.man_appr_status == nil}.count
    end

    @low_stock_count = 0


    @materials = Material.all
    @materials.each do |material|
      if current_user.role == "engineer"
        if (material.qty < material.alertlevel && material.location == current_user.location)
          @low_stock_count += 1
        end
      elsif current_user.role == "manager"
        if (material.qty < material.alertlevel)
          @low_stock_count += 1
        end
      end
    end

    # @sites = Site.all
    # The `geocoded` scope filters only sites with coordinates
    @markers = @sites.geocoded.map do |site|
      {
        lat: site.latitude,
        lng: site.longitude,
        # info_window_html: render_to_string(partial: "sites/info_window", locals: { site: }),
        marker_html: render_to_string(partial: "sites/marker", locals: { site: }) # Pass the flat to the partial
      }
    end
  end
end
