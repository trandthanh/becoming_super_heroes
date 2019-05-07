class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def notrehistoire
  end

  def nosactions
  end
end
