class Admin::MatchesController < ApplicationController
  before_action :authenticate_admin

  def index
    @recent_matches = Match.all.last(10)
    @matches = Match.all

    @new_mentees = Mentee.where.not(mentor: nil)
  end

  def show

  end
end
