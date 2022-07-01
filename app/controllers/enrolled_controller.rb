class EnrolledController < ApplicationController
    before_action :authenticate_user!
    before_action :only_teachers

    def index
        @students = Course.find(params.id).users
    end


    private
    def only_teachers
        if current_user.role != 2 current_user.id != Course.find(params[:id].to_i).user_id
          redirect_to root_path
        end
      end
end
