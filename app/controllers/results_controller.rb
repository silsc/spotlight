class ResultsController < ApplicationController

  def index
    if params[:query].present?
      @artists = Artist.where('name ilike ?', "%#{params[:query]}%")
      @labels = Label.where('name ilike ?', "%#{params[:query]}%")
    end
  end
end
