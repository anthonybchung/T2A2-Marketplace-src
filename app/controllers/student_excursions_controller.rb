class StudentExcursionsController < ApplicationController
    def show
        @excursion = Excursion.find(params[:id])
        @groups = @excursion.groups
        @is_a_driver = Group.where(user_id: current_user,excursion_id: params[:id])
    end
end
