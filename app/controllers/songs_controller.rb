class SongsController < ApplicationController
  def log
    @song = Song.new(song_params)
    if @song.save
      respond_to do |format|
        format.json { render json: {:song => @song}}
      end
    else
      flash[:error] = "Error logging song!"
    end
  end

  private

  def song_params
    params.require(:song).permit(:title, :artist, :requested_by)
  end
end
