class CoursesController < ApplicationController
# Only be accessed by the appropriate user.
    before_action :authenticate_user!
    before_action :only_teachers

    def index
        @courses = Course.all
    end


    def filter
        @courses = Course.where(user_id: current_user.id)
    end

    def show
        @course = Course.find(params[:id])
    end

    def edit
        @course = Course.find(params[:id])
    end

    def update
        @course = Course.find(params[:id])
        if @course.update(course_params)
            redirect_to course_path
        else
            render :edit
        end
    end

    private

    def only_teachers
        if current_user.role!=2
            redirect_to root_path, alert: "You are not authorized"
        end
    end

    def show_params
        params.require(:course).permit(:id)
    end

    def course_params
        params.require(:course).permit(:name,:description,:year,:month,:active)
    end
end
