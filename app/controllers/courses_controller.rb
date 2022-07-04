class CoursesController < ApplicationController
# Only be accessed by the appropriate user.
    before_action :authenticate_user!
    before_action :only_teachers

    def index
        @courses = Course.all
    end

    def search
        # serach by id.
        if !params[:query].match?(/\D+/)
            @courses = []
            @courses =  Course.where(id: params[:query].to_i, user_id: current_user).order(active: :desc)
        else
        # search by course name
            @courses = Course.where(name: params[:query],user_id: current_user).order(active: :desc)
        end
       

        if @courses.length == 0
            @courses = Course.where(user_id: current_user)
        end
    end


    def filter
        @courses = Course.where(user_id: current_user.id).order('name')
    end

    def show
        @course = Course.find(params[:id])
        @enrollments = @course.enrollments
        @excursions = @course.excursions
        
    end

    def edit
        @course = Course.find(params[:id])
    end

    def update
        @course = Course.find(params[:id])
        if @course.update(course_params)
            redirect_to course_path(params[:id])
        else
            render :edit
        end
    end

    def new
        @course = Course.new
    end

    def enrollment
        @enrollment = Enrollment.find(params[:id])
    end

    def create
        @course = Course.new(course_params)

        if @course.save
            redirect_to course_path(@course.id)
        else
            render :new
        end
    end

    def destroy
        @course = Course.find(params[:id])
        if @course.destroy
            redirect_to root_path, status: 303,data: {turbo_method: :get}
        else
            render :show
        end
    end
    

    private

    def only_teachers
        if current_user.role ==2 ||params[:id] == nil
            
        elsif current_user.role!=2 || current_user.id != Course.find(params[:id].to_i).user_id
            redirect_to root_path, alert: "You are not authorized"
        end
    end

    def show_params
        params.require(:course).permit(:id)
    end

    def course_params
        params.require(:course).permit(:name,:description,:year,:month,:active,:user_id)
    end
end
