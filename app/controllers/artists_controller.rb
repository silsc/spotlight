class ArtistsController < ApplicationController
  before_action :set_artist, only: %i[show edit update]
  before_action :following_users, only: [ :follow, :unfollow ] 
  before_action :redirect_if_profile_exists, only: %i[new]
  def show
    @song = Song.new
    if current_user.artist && current_user.artist.songs
      @songs = current_user.artist.songs
    else
      @songs = []
    end

    @event = Event.new
    @events = @artist.events.map do |event|
      {
        year: event.date.year,
        month: event.date.month,
        day: event.date.day,
        Date: [event.date.year, event.date.month, event.date.day],
        Title: event.name,
        Link: event.event_url,
        html: render_to_string(partial: "events/event_card", locals: { event: event })
      }
    end

    @grouped_events = {}
    @events.each do |event|
      @grouped_events[event[:year]] = @grouped_events[event[:year]] || {}
      @grouped_events[event[:year]][event[:month]] = @grouped_events[event[:year]][event[:month]] || {}
      @grouped_events[event[:year]][event[:month]][event[:day]] =
        @grouped_events[event[:year]][event[:month]][event[:day]] || []
      @grouped_events[event[:year]][event[:month]][event[:day]].push(event)
    end
  end

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.new(artist_params)

    @artist.user = current_user
    # authorize @artist
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
      render :show
    end
  end

  def follow
    current_user.follow(@follow_user)
    redirect_to artist_path(@id_artist)
  end

  def unfollow
    current_user.unfollow(@follow_user)
    redirect_to artist_path(@id_artist)
  end

  private

  def artist_params
    params[:artist][:influences] = params[:artist][:influences]&.split(',')
    params.require(:artist).permit(:name, :age, :location, :bio, :photo, :soundcloud_url, :website_url, :youtube_url,
                                   :instagram_url, genres: [], roles: [], influences: [])
  end

  def redirect_if_profile_exists
    redirect_to artist_path(current_user.artist) unless current_user.artist.nil?
  end

  def set_artist
    @artist = Artist.find(params[:id])
    # authorize @artist
  end

  def following_users
    @id_artist = params[:artist_id]
    @user = Artist.find(@id_artist ).user_id
    @follow_user = User.find(@user)
  end
end
