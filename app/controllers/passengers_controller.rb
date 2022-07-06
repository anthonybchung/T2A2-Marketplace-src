class PassengersController < ApplicationController
    before_action :authenticate_user!

    def new
        #student wants to be a passenger in this group
        #student clicks on the group.
        # the app pass the group_id.
        #  we display the group information.
        # - driver
        # - excursion details
        # - other passengers in the group
        @group = Group.find(params[:group])
        @driver = User.find(@group.user_id)
        @excursion = Excursion.find(@group.excursion_id)
        @passengers = Passenger.where(group_id: params[:group])
    end
    
    def create
        # an passenger entity is greated with a group_id, and the current_user id.
        @passenger = Passenger.new(group_id: params[:group],user_id: current_user.id)

        # an excursion id need to be found to redirect the app to the appropriate page for loading into turbo_frame.
        excursion_id = Group.find(params[:group]).excursion.id


        if @passenger.save
            redirect_to student_excursion_path(excursion_id),status: 303
        else
            render :new
        end
    end

    def show
        # display User that created this group. Driver.
        # Excursion details
        # and list the passengers in this group
        @group = Group.find(params[:id])
        @driver = User.find(@group.user_id)
        @excursion = Excursion.find(@group.excursion_id)
        @passengers = Passenger.where(group_id: params[:id])
    end

    def destroy
        # status 303 is used to convert turbo_method destroy back to get or show.
        #find the correct passenger row, which is the correct group and correct user.
        #the result will be an array, thus .first needs to extract the value for destroy.
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
