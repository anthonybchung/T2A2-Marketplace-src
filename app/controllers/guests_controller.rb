class GuestsController < ApplicationController
 
  def index
    if current_user == nil
      #do nothing
    elsif current_user.role == 2
      redirect_to teachers_index_path
    elsif current_user.role == 1
      redirect_to students_index_path
    end
  end

  def about
  end

  def help
  end
end
