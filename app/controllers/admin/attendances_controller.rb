class Admin::AttendancesController < ApplicationController

  def new
    @course = Course.find(params[:course_id])
    @attendance = Attendance.new
  end

  def create
    @course = Course.find(params[:course_id])
    @user = User.find(params[:attendance][:user])
    @attendance = Attendance.new(attendance_params)
    @attendance.course = @course
    @attendance.user = @user
    if @attendance.save!
      @attendance.attended = true
      redirect_to new_admin_course_attendance_path(@course)
    end
  end

  private

    def attendance_params
      params.require(:attendance).permit(:course_id, :user_id)
    end
end
