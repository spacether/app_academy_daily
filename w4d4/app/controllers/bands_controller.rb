class BandsController < ApplicationController

  before_action :ensure_logged_in

  def index
    @bands = Band.all.order(:id)
  end

  def new
    @band = Band.new
  end

  def create
    band = Band.new(band_params)
    method_and_goto(band, :save, bands_url, new_band_url)
  end

  def show
    @band = Band.find_by_id(params[:id])
    if @band.nil?
      flash[:errors] = ["Band not found"]
      redirect_to bands_url
    end
  end

  def edit
    @band = Band.find_by_id(params[:id])
    if @band.nil?
      flash[:errors] = ["Band not found"]
      redirect_to bands_url
    end
  end

  def update
    band = Band.find_by_id(params[:id])
    method_and_goto(band, :update, bands_url, band_url(band), band_params)
  end

  def destroy
    band = Band.find_by_id(params[:id])
    method_and_goto(band, :destroy, bands_url, band_url(band))
  end

  private

  def band_params
    params.require(:band).permit(:name)
  end

end
