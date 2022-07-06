class ExcursionsController < ApplicationController
    before_action :authenticate_user!
    
    def new
        @course_id = params[:course_id].to_i
        @excursion = Excursion.new
        @excursion.course_id = params[:course_id].to_i
    end

    def create
        @excursion = Excursion.new(excursion_params)
        if @excursion.save
            redirect_to course_path(@excursion.course_id)
        else
            render :edit
        end

    end

    def edit
        @excursion = Excursion.find(params[:id])
        @course_id = @excursion.course_id
    end

    def update
        @excursion = Excursion.find(params[:id])
        if @excursion.update(excursion_params)
            
            redirect_to course_path(@excursion.course_id)
        else
            render :edit
        end
    end

    def show

    end

    def destroy
        @excursion = Excursion.find(params[:id])
        course_id = @excursion.course_id
        if @excursion.destroy
            redirect_to course_path(course_id), status: 303,data: {turbo_method: :get}
        else
            render :edit
        end
    end

    private
    def excursion_params
        params.require(:excursion).permit(:name,:description,:arrive_time,:street_number,:street_name,:suburb,:city,:state,:post_code,:course_id,:image)
    end

end
