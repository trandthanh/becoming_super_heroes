class Admin::CoursesController < ApplicationController
  before_action :authenticate_admin

  def index
    @courses = Course.all
    @head_subjects = Subject.where(category: 'Tête')
    @body_subjects = Subject.where(category: 'Corps')
    @confidence_subjects = Subject.where(category: 'Confiance')
    @skills_subjects = Subject.where(category: 'Compétences')
  end


  def new
    @course = Course.new
  end



  def create
    @teacher = Teacher.find(params[:course][:teacher_id])
    @subject = Subject.find(params[:course][:subject_id])

    @course = Course.new(course_params)
    @course.teacher = @teacher
    @course.subject = @subject

    @course.save!
    redirect_to admin_courses_path
  end

  private

    def course_params
      params.require(:course).permit(:location, :capacity, :schedule, :teacher_id, :subject_id)
    end
end
