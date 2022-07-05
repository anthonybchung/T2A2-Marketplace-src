class StudentExcursionsController < ApplicationController
    def show
        @excursion = Excursion.find(params[:id])
        @groups = @excursion.groups
        if 0 < Group.where(user_id: current_user,excursion_id: params[:id]).length
            @is_a_driver = true
        else
            @is_a_driver = false
        end

        if @excursion.passengers.where(user_id: current_user).length >0
            @is_a_passenger = true
        else
            @is_a_passenger = false
        end       
    end
end
