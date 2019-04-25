class Admin::UsersController < ApplicationController
  before_action :authenticate_admin

  def index
    @users = User.where.not(admin: true)
  end
end
