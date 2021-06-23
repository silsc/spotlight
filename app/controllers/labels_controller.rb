class LabelsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]
  before_action :set_label, only: %i[show edit update]
  before_action :following_users, only: %i[follow unfollow]
  before_action :redirect_if_profile_exists, only: %i[new]

  def new
    @label = Label.new
  end

  def create
    @label = Label.new(label_params)

    @label.user = current_user
    # authorize @label

    if @label.save!
      redirect_to label_path(@label)
    else
      render :new
    end
  end

  def show
    @event = Event.new
    @events = @label.events.map do |event|
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

  def edit
  end

  def update
    if @label.update(label_params)
      redirect_to label_path(@label)
    else
      render :show
    end
  end

  def follow
    current_user.follow(@follow_user)
    redirect_to label_path(@id_label)
  end

  def unfollow
    current_user.unfollow(@follow_user)
    redirect_to label_path(@id_label)
  end

  private

  def label_params
    params.require(:label).permit(:name, :location, :bio, :photo, :website_url, :user_type)
  end

  def redirect_if_profile_exists
    redirect_to label_path(current_user.label) unless current_user.label.nil?
  end

  def set_label
    @label = Label.find(params[:id])
    # authorize @label
  end

  def following_users
    @id_label = params[:label_id]
    @user = Label.find(@id_label).user_id
    @follow_user = User.find(@user)
  end
end
