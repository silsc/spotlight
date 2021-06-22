class ConnectionsController < ApplicationController
  def index
    @connectons = Connection.where
  end
end
