class StudentExcursionsController < ApplicationController
    def show
        @excursion = Excursion.find(params[:id])
        @groups = @excursion.groups
    end
end
