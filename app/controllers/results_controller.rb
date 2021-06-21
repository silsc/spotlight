class ResultsController < ApplicationController

  def index
    if params[:query].present?
      @artists = Artist.where('name ilike ?', "%#{params[:query]}%")
      @labels = Label.where('name ilike ?', "%#{params[:query]}%")
    end

    if params[:filter]
      @artists = Artist.filter_by_genres(params[:filter][:genres])
    end
      # @artists = Artist.filter_by_roles(params[:filter][:roles])
      # @artists = Artist.filter_by_location(params[:filter][:location])
  end

end
