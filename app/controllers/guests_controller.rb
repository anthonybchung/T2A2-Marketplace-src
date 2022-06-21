class GuestsController < ApplicationController
  def index
    unless current_user.nil?
      if current_user.role == 2
        redirect_to teachers_index_path
      end  
    end
  end

  def about
  end

  def help
  end
end
