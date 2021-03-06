class LessonsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_enrolled_in_current_lesson, only: [:show]

  def show
  end
  
  private

  def require_enrolled_in_current_lesson
    unless current_user.enrolled_in?(current_lesson.section.course)
      redirect_to current_lesson.section.course, alert: 'Enroll to view content'
    end

  end

  helper_method :current_lesson
  def current_lesson
    @current_lesson ||= Lesson.find(params[:id])
  end    
end
