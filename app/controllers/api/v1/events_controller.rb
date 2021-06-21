class Api::V1::EventsController < Api::V1::BaseController
  def index
    @events = Event.all
  end

  def show
    selected_date = Date.parse(params[:id])

    @event = Event.where(date: selected_date.beginning_of_day..selected_date.end_of_day,
                         organizable_id: params[:user_id])
    # http://localhost:3000/api/v1/events/2021-06-18?user_id=1
    # authorize @event For Pundit
  end
end
