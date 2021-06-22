class ApplicationController < ActionController::Base
  before_action :set_user_type
  before_action :authenticate_user!
  include Pundit

  # after_action :verify_authorized, except: :index, unless: :skip_pundit?
  # after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end

  def set_user_type
    session[:user_type] = 'artist' if controller_name == 'artists' && action_name == 'new'
    session[:user_type] = 'label' if controller_name == 'labels' && action_name == 'new'
  end

  def after_sign_in_path_for(resource)
    if current_user.user_type == 'artist'
      stored_location_for(resource) || artist_path(resource.artist)
    else
      stored_location_for(resource) || label_path(resource.label)
    end
  end
end
