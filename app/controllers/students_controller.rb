class StudentsController < ApplicationController
  before_action :authenticate_user!
  before_action :only_students
  
  def index
  end

  private

  def only_students
    if current_user.role != 1
      redirect_to root_path
    end
  end
end
