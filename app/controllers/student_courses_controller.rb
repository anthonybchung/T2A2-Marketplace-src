class StudentCoursesController < ApplicationController

    #display search field to search for course.
    # search by I.D given by teacher.
    # search by Name given by teacher.
    # search by Teacher's name.
    def index

    end

    def search
        if !params[:query].match?(/\D/)
            @courses = []
            @courses =  Course.where(id: params[:query].to_i, active: true)
           
        elsif params[:query].match?(/@/)
            teacher = User.where(email: params[:query]).first
            @courses = Course.where(user_id: teacher.id, active: true)
        else
            @courses = Course.where(name: params[:query],active: true)
        end

        if @courses.length == 0
             redirect_to student_courses_path, alert: "No course found"
        end
    end

    # student enrolls into a course.
    # Model: Enrollment
    # it takes: - user_id
    #           - course_id
    def show
        @course = Course.find(params[:id])
        puts current_user
        Enrollment.create(user_id: current_user.id, course_id: @course.id)
        
    end
    # def course_params
    #     params[:course].permit(:id,:name,:user_id)
    # end
end
