class Admin::CoursesController < ApplicationController
  before_action :authenticate_admin

  def index
    @head_subjects = Subject.where(category: 'Tête')
    @body_subjects = Subject.where(category: 'Corps')
    @confidence_subjects = Subject.where(category: 'Confiance')
    @skills_subjects = Subject.where(category: 'Compétences')
  end
end
