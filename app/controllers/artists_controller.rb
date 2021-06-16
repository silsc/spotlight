class ArtistsController < ApplicationController
  before_action :set_artist, only: %i[show edit update]

  def show
  end

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.new(artist_params)
    @artist.user = current_user
    if @artist.save!
      redirect_to artist_path(@artist)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @artist.update(artist_params)
      redirect_to artist_path(@artist)
    else
      render :edit
    end
  end

  private

  def artist_params
    params.require(:artist).permit(:name, :age, :location, :bio, :influences, :soundcloud_url, :website_url, :youtube_url, :instagram_url, genres: [])
  end

  def set_artist
    @artist = Artist.find(params[:id])
  end
end
