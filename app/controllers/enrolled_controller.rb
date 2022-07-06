class EnrolledController < ApplicationController
    before_action :authenticate_user!
    before_action :only_teachers

    def index
        @students = Course.find(params.id).users
    end

    def edit
        @enrollment = Enrollment.find(params[:id])
    end

    def update 
      # Update student/User status. 
      #a User can be banned from a course.
      @enrollment = Enrollment.find(params[:id])
      if @enrollment.update(enrollment_params)
        redirect_to course_path(@enrollment.course_id)
      else
        
      end

    end


    private
    
    def only_teachers
        if current_user.role != 2 
          redirect_to root_path
        end
      end

      def enrollment_params
        params.require(:enrollment).permit(:course_id, :user_id,:banned)
      end
end
