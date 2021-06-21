class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home styleguide redirect]

  def home
  end

  def styleguide
  end

  def redirect
  end

  def spotify
    artists = RSpotify::Artist.search(params[:query])
    respond_to do |format|
      format.json {render json: artists}
    end
  end
end
