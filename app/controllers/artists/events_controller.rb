class Artists::EventsController < EventsController
  before_action :set_organizable

  private

  def set_organizable
    @organizable = Artist.find(params[:artist_id])
  end
end
