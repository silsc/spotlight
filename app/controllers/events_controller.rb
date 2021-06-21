class EventsController < ApplicationController
  def create
    @event = @organizable.events.new(event_params)
    @event.save
    redirect_to @organizable, notice: "Your event was successfully created."
  end

  # def index
  #   @events = Event.where(organizable_name: current_user.artist.name)
  #   raise
  # end

  private

  def event_params
    params.require(:event).permit(:date, :name, :location, :event_url)
  end
end
