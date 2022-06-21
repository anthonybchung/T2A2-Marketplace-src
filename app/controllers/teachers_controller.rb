class TeachersController < ApplicationController
  before_action :authenticate_user!
  before_action :only_teachers
  
  def index
  end


  def only_teachers
    if current_user.role != 2
      redirect_to root_path
    end
  end
end
