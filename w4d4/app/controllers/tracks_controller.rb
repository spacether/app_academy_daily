class TracksController < ApplicationController
  before_action :ensure_logged_in

  def new
    @track = Track.new(album_id: params[:album_id])
  end

  def create
    track = Track.new(track_params)
    method_and_goto(track, :save, album_url(track.album),
                    new_album_track_url(track.album))
  end

  def show
    @track = Track.find_by_id(params[:id])
    if @track.nil?
      flash[:errors] = ["Track not found"]
      redirect_to bands_url
    end
  end

  def edit
    @track = Track.find_by_id(params[:id])
    if @track.nil?
      flash[:errors] = ["Track not found"]
      redirect_to bands_url
    end
  end

  def update
    track = Track.find_by_id(params[:id])
    method_and_goto(track, :update, album_url(track.album), track_url(track), track_params)
  end

  def destroy
    track = Track.find_by_id(params[:id])
    method_and_goto(track, :destroy, album_url(track.album), track_url(track))
  end

  private

  def track_params
    params.require(:track).permit(:album_id, :track_type, :lyrics)
  end
end
