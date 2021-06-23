class ResultsController < ApplicationController

  def index
    @artists = Artist.all
    @labels = Label.all
    if params[:filter].present?
      @query = params[:filter][:query]
      @search_genres = params[:filter][:genres]
      @search_roles = params[:filter][:roles]
      @search_location = params[:filter][:location]
      @artists = @artists.where('name ilike ?', "%#{@query}%") if @query
      @labels = Label.where('name ilike ?', "%#{@query}%") if @query
      @artists = @artists.filter_by_genres(@search_genres) if @search_genres
      @artists = @artists.filter_by_roles(@search_roles) if @search_roles
      @artists = @artists.filter_by_location(@search_location) if @search_location.present?
    end
  end
end
