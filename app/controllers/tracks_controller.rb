class TracksController < ApplicationController
  skip_before_action :authenticate_user!, only: [:create]

  def create
    # raise
  end

end
