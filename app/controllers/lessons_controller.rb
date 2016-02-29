class LessonsController < ApplicationController
	before_action :authenticate_user!
	before_action :require_course_enrollment_for_lessons, :only => [:show]

	def show

	end

  	private

  	def require_course_enrollment_for_lessons
  		enrolled_course = current_lesson.section.course

    	if !current_lesson.section.course.user.enrolled_in?(enrolled_course)
    		redirect_to course_path(enrolled_course), alert: 'You must be enrolled to view lessons!'
      	end
	end

  helper_method :current_lesson
  def current_lesson
    @current_lesson ||= Lesson.find(params[:id])
  end
end