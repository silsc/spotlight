class EventsController < ApplicationController
  def create
    @event = Event.new(event_params)
    @organizable = params[:label_id].nil? ? Artist.find(params[:artist_id]) : Label.find(params[:label_id])
    @event.organizable = @organizable
    if @event.save
      redirect_to polymorphic_path(@organizable, tab: 'events')
    else
      respond_to do |format|
        format.js
      end
    end
  end

  private

  def event_params
    params.require(:event).permit(:date, :name, :location, :event_url)
  end
end
