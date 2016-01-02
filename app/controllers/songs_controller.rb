class SongsController < ApplicationController
  def log
    @song = Song.new(song_params)
    if @song.save
      respond_song_json
    else
      flash[:error] = "Error logging song!"
    end
  end

  def now_playing
    @song = Song.order(created_at: :desc).first
    respond_song_json
  end
  private

  def song_params
    params.require(:song).permit(:title, :artist, :requested_by, :show_id)
  end

  def respond_song_json
    respond_to do |format|
      format.json { render json: {:song => @song }}
    end
  end
end
