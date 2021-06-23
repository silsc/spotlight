class ConnectionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  def index
    @connectons = Connection.all
  end

  def create
    @user = User.find(params[:user_id])
    current_user.follow(@user)
    redirect_back fallback_location: root_path
  end

  def destroy
    @connection = Connection.find(params[:id])
    @connection.destroy
    redirect_back fallback_location: root_path
  end
end
