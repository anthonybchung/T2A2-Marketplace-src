class StudentGroupsController < ApplicationController
    def new
       @excursion_id = params[:excursion_id]
       @group = Group.new
    end

    def create
        @group = Group.new(group_params)
        cost = group_params[:total_cost] * 100
        @group.total_cost = cost

        if @group.save
            redirect_to student_excursion_path(@group.excursion_id)
        else
            redirect :new
        end
    end

    def show
        @group = Group.find(params[:id])
        @group[:total_cost] = @group[:total_cost] /100
        @user_name = User.find(@group.user_id).user_name
    end

    def edit
        @group = Group.find(params[:id])
        @group[:total_cost] = @group[:total_cost] /100
        @excursion_id = params[:excursion_id]
    end

    def update
        @group = Group.find(params[:id])
        updated_group = group_params
        cost  = updated_group[:total_cost].to_i * 100
        updated_group[:total_cost] = cost
       

        if @group.update(updated_group)
            redirect_to student_excursion_path(@group.excursion_id)
        else
            render :edit
        end
    end
    
    private

    def group_params
        params.require(:group).permit(:description,:total_cost,:passenger_no,:user_id,:excursion_id,:suburb,:id)
    end
end
