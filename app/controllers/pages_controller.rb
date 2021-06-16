class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home styleguide]

  def home
  end

  def styleguide
  end
end
