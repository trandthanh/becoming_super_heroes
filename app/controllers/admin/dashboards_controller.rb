class Admin::DashboardsController < ApplicationController
  before_action :authenticate_admin

  def index
    @recent_wishes = Wish.where(status: "Nouveau").sort_by(&:created_at)

  end

end
