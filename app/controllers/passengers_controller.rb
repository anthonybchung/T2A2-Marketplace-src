class PassengersController < ApplicationController
    def new
        @passenger = Passenger.new(group_id: params[:group],user_id: current_user.id)
        
        
    end
    def create
        @passenger = Passenger.new(passenger_params)

        if @passenger.save
            redirect_to student_group_path(passenger_params[:group_id].to_i)
        else
            render :new
        end
    end

    def passenger_params
        params.require(:passenger).permit(:group_id,:user_id)
    end
end
