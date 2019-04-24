class Admin::DashboardsController < ApplicationController
  before_action :authenticate_admin

  def index
    @recent_wishes = Wish.where.not(user: nil).last(10).sort_by(&:created_at)

  end

end
