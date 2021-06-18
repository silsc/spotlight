class SongsController < ApplicationController

  def create
    @artist = Artist.find(params[:artist_id])
    @song = Song.new(songs_params)
    @song.artist = @artist
    @song.save
    redirect_to artist_path(@artist)
  end

  private

  def songs_params
    params.require(:song).permit(:title, :artist_name, :released, :song_description, :track)
  end
end
