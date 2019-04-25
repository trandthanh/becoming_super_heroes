class Admin::MatchesController < ApplicationController
  before_action :authenticate_admin

  def index
    @matches = Match.all










  end
end
