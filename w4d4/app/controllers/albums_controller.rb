class AlbumsController < ApplicationController
  before_action :ensure_logged_in

  def new
    @album = Album.new(band_id: params[:band_id])
  end

  def create
    album = Album.new(album_params)
    method_and_goto(album, :save, band_url(album.band),
                    new_band_album_url(album.band))
  end

  def show
    @album = Album.find_by_id(params[:id])
    if @album.nil?
      flash[:errors] = ["Album not found"]
      redirect_to band_url(album.band)
    end
  end

  def edit
    @album = Album.find_by_id(params[:id])
    if @album.nil?
      flash[:errors] = ["Album not found"]
      redirect_to band_url(album.band)
    end
  end

  def update
    album = Album.find_by_id(params[:id])
    method_and_goto(album, :update, band_url(album.band), album_url(album), album_params)
  end

  def destroy
    album = Album.find_by_id(params[:id])
    method_and_goto(album, :destroy, band_url(album.band), album_url(album))
  end

  private

  def album_params
    params.require(:album).permit(:band_id, :album_type)
  end
end
