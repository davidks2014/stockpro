class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @sites = Site.geocoded
    @requests = Request.all
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
