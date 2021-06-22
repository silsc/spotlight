class ConnectionsController < ApplicationController
  def index
    @connectons = Connection.all
  end
end
