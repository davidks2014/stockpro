class SitesController < ApplicationController
  before_action :set_site, only: %i[ show edit update destroy ]

  # GET /sites
  def index
    @sites = Site.geocoded
    # @sites = Site.all
    # The `geocoded` scope filters only sites with coordinates
    @markers = @sites.geocoded.map do |site|
      {
        lat: site.latitude,
        lng: site.longitude,
        # info_window_html: render_to_string(partial: "info_window", locals: { site: site }),
        marker_html: render_to_string(partial: "marker", locals: {site: site}) # Pass the flat to the partial
      }
    end
  end

  # GET /sites/1
  def show
    @site = Site.includes(:users).find(params[:id])
  end

  # GET /sites/new
  def new
    @site = Site.new
  end

  # GET /sites/1/edit
  def edit
  end

  # POST /sites
  def create
    @site = Site.new(site_params)

    if @site.save
      redirect_to @site, notice: "Site was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /sites/1
  def update
    if @site.update(site_params)
      redirect_to @site, notice: "Site was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /sites/1
  def destroy
    @site.destroy
    redirect_to sites_url, notice: "Site was successfully destroyed.", status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_site
      @site = Site.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def site_params
      params.require(:site).permit(:name, :address)
    end
end
