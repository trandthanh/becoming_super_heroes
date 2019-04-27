class Admin::MenteesController < ApplicationController
  before_action :authenticate_admin

  def show
    @mentee = Mentee.find(params[:id])

    # Matching Method

    mentee_age = @mentee.user.age
    mentee_hospital = @mentee.user.hospital
    mentee_sickness = @mentee.user.sickness
    mentee_headhobby = @mentee.user.hobby_head
    mentee_bodyhobby = @mentee.user.hobby_body

    near_users = User.near([@mentee.user.latitude, @mentee.user.longitude], 10)

    score_array = []

    near_users.each do |user|
      score = 0
      user.age == mentee_age ? score += 1 : score += 0
      user.hospital == mentee_hospital ? score += 1 : score += 0
      user.sickness == mentee_sickness ? score += 1 : score += 0
      user.hobby_head == mentee_headhobby ? score += 1 : score += 0
      user.hobby_body == mentee_bodyhobby ? score += 1 : score += 0
      score_array << {email: user.email, score: score}
    end

    top_matches_array = score_array.group_by{ |h| h[:score] }.sort_by  { |k, v| -k }.first(2).map(&:last).flatten
    @top_matches = top_matches_array.map do |match|
      User.find_by(email: match[:email])
    end
  end
end
