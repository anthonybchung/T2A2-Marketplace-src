class StudentCoursesController < ApplicationController
    before_action :authenticate_user!
    before_action :only_students

    
    def index

    end
    #display search field to search for course.
    # search by I.D given by teacher.
    # search by Name given by teacher.
    # search by Teacher's name.
    def search
        #return all active courses if query input is null
        if params[:query] == ""
            @courses = Course.where(active: true)
        elsif !"#{params[:query]}".match?(/\D+/)
            @courses = []
            @courses =  Course.where(id: params[:query].to_i, active: true)
        elsif params[:query].match?(/@/)
            teacher = User.where(email: params[:query]).first
            @courses = Course.where(user_id: teacher.id, active: true)
        elsif params[:query].length > 0
            @courses = Course.where(name: params[:query],active: true)
        end
    
        #nothing found, redirect to student index with alert message.
        if @courses.length == 0
            
            redirect_to students_index_path, alert: "Nothing found"
        end
    end

    # student enrolls into a course.
    # Model: Enrollment
    # it takes: - user_id
    #           - course_id
    def show
        @course = Course.find(params[:id])
        @excursions = @course.excursions
        if(current_user != nil)
            if @course.enrollments.where(user_id: current_user.id).length==0
                Enrollment.create(user_id: current_user.id, course_id: @course.id,banned: false)
            end
        end    
    end
    

    private

    def only_students
      if current_user.role != 1
        redirect_to root_path
      end
    end
end

