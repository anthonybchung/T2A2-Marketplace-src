class CoursesController < ApplicationController
# Only be accessed by the appropriate user.
    before_action :authenticate_user!
    before_action :only_teachers

    def index
        @courses = Course.all
    end

    def search
        # serach by id and only select those that belongs to the current user.
        #list all active courses on top of the list first.
        if !params[:query].match?(/\D+/)
            @courses = []
            @courses =  Course.where(id: params[:query].to_i, user_id: current_user).order(active: :desc)
        else
        # search by course name
            @courses = Course.where("name LIKE?", "%#{params[:query]}%")
        end
       
        # if the search returns nothing, it will list all the courses that was created by the current user.
        if @courses.length == 0
            @courses = Course.where(user_id: current_user)
        end
    end


    def filter
        # get courses that was created by the current user and order it by name.
        @courses = Course.where(user_id: current_user.id).order('name')
    end

    def show
        #user will select a course to analyse.
        @course = Course.find(params[:id])
        #since this app tries to be a single page app.
        #students enrolled into the course will be shown.
        #excursion that was created within this course is shown on the page.
        @enrollments = @course.enrollments
        @excursions = @course.excursions
    end

    def edit
        #user will select a course the view will pass the course_id to edit.
        @course = Course.find(params[:id])
    end

    def update
        #after the update button is clicked
        #find a course.
        @course = Course.find(params[:id])
        new_name = course_params[:name]

        # check if a course name is already created by current_user.
        #find the existing name in the database.
        #if the course.id in the edit is different to the course.id that was searched by name
        # then the course name is not valid.
        existing_name = Course.where(name: new_name).first
      
        if params[:id].to_i != existing_name.id.to_i
            redirect_to edit_course_path(params[:id]), alert: 'You already have created a course after this name. Choose another'
        else
            @course.update(course_params)
            redirect_to course_path(params[:id])
        end
    end

    def new
        #inform the form that it will be a create/new button
        @course = Course.new
    end

    def enrollment
        #user will choose a student, the link_to will pass a User/Student id.
        # This student ID will be used to retrieve the enrollment of the student
        # The teacher can now edit the student's enrollment status on the view.
        @enrollment = Enrollment.find(params[:id])
    end

    def create
        @course = Course.new(course_params)
        
        # check if a course name is already created by current_user.
        # if name already exist, it will return an array greater than 0.
        # then the app will be redirected to the edit page with an alert.
        # if no name is the same. Update may proceed because array length will be 0.

        if Course.where(name: @course.name, user_id: current_user.id).length > 0
            redirect_to new_course_path, alert: 'You have created a course after this name. Choose another'
        else
            @course.save
            redirect_to course_path(@course.id)
        end
    end

    def destroy
        @course = Course.find(params[:id])
        course_id = params[:id]
        # A course can only be deleted if there is no student.
        # Check if the course have students.
        # If there is. Redirect with an alert.
        # status 303 must be introduced to change turbo_stream from destoy to get.
        if @course.users.length > 0
            redirect_to courses_path, status: 303, data: {turbo_method: :get},alert: "Can not delete course because there are students in the course. You can make it in active."
        else
            @course.destroy
            redirect_to root_path, status: 303,data: {turbo_method: :get}
            
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
