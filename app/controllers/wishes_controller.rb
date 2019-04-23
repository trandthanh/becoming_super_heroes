class WishesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new]

  def new
    @wish = Wish.new

    @track = Track.new

    @head_subjects = Subject.where(category: 'Tête')
    @body_subjects = Subject.where(category: 'Corps')
  end

  def create
    raise

  end

end
