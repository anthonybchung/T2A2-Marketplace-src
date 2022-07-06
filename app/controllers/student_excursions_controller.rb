class StudentExcursionsController < ApplicationController
    before_action :authenticate_user!


    def show
        #an excursion ID is passed in.
        @excursion = Excursion.find(params[:id])
        #all the groups created for this excursion is needed.
        @groups = @excursion.groups


        # the below is to build logic in the font end cleaner.
        # the logic is for displaying the appropriate buttons in the table or page.
        #----------------------------------------------------------------
        
        #see if the current user has created a group related to this excursion.
        #if the result returns an array of length greater than 0. It means he/she is a driver.
        if 0 < Group.where(user_id: current_user,excursion_id: params[:id]).length
            @is_a_driver = true
        else
            @is_a_driver = false
        end

        #Get all the passengers in this excursion where it is equal to the current user.
        # If the length of the array is greater than 0 then he/she is a passenger.
        if @excursion.passengers.where(user_id: current_user).length >0
            @is_a_passenger = true
        else
            @is_a_passenger = false
        end       
    end
end
