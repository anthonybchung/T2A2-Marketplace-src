class PassengersController < ApplicationController
    before_action :authenticate_user!

    def new
        @group = Group.find(params[:group])
        @driver = User.find(@group.user_id)
        @excursion = Excursion.find(@group.excursion_id)
        @passengers = Passenger.where(group_id: params[:group])
    end
    
    def create
        @passenger = Passenger.new(group_id: params[:group],user_id: current_user.id)
        excursion_id = Group.find(params[:group]).excursion.id


        if @passenger.save
            redirect_to student_excursion_path(excursion_id),status: 303
        else
            render :new
        end
    end

    def show
        @group = Group.find(params[:id])
        @driver = User.find(@group.user_id)
        @excursion = Excursion.find(@group.excursion_id)
        @passengers = Passenger.where(group_id: params[:id])
    end

    def destroy
        passenger = Passenger.where(group_id: params[:id],user_id: current_user.id).first
        excursion_id = Group.find(params[:id]).excursion.id
        if passenger.destroy
            redirect_to student_excursion_path(excursion_id),status: 303
        else
            render :show
        end
    end

    def passenger_params
        params.require(:passenger).permit(:group_id,:user_id)
    end

    
end
