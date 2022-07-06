class GuestsController < ApplicationController
 
  #for devise. 
  #this is the root
  # so when the logo is clicked, it will redirect to a different path depending what user is logged in.
  def index
    if current_user == nil
      #do nothing
    elsif current_user.role == 2
      redirect_to teachers_index_path
    elsif current_user.role == 1
      redirect_to students_index_path
    end
  end

  # for future implementation to explain how to use the web app.
  def about
  end

  def help
  end
end
