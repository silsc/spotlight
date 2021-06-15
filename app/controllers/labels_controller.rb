class LabelsController < ApplicationController
  before_action :set_label, only: %i[show edit update]

  def new
    @label = Label.new
  end

  def create
    @label = Label.new(label_params)
    @label.user = current_user

    if label.save!
      redirect_to label_path(@label)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @label.update(label_params)
      redirect_to label_path(@label)
    else
      render :edit
    end
  end

  private

  def label_params
    params.require(:label).permit(:name, :location, :bio, :website_url)
  end

  def set_label
    @label = Label.find(params[:id])
    # authorize @label when we add pundit
  end
end
