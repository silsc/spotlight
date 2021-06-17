class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home styleguide redirect]

  def home
  end

  def styleguide
  end

  def redirect
  end
end
