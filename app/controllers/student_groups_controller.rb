class StudentGroupsController < ApplicationController
    def new
       @excursion_id = params[:excursion_id]
       @group = Group.new
    end

    def create
        @group = Group.new(group_params)
        cost = group_params[:total_cost].to_i * 100
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
        @is_a_passenger = Passenger.where(group_id: @group.id, user_id: current_user.id).length
        if @group[:user_id] == current_user.id
            @is_a_driver = true
        else
            @is_a_driver = false
        end

       
        if @group[:passenger_no] <= Passenger.where(group_id: @group[:id]).length
            @full = true
        else
            @full = false
        end
        @passengers = Passenger.where(group_id: params[:id])
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

    def destroy
        @group = Group.find(params[:id])
        excursion_id = @group.excursion_id
        if @group.passengers.length > 0
            
            redirect_to student_excursion_path(excursion_id),status: 303, data:{turbo_method: :get}, alert: 'Please inform your fellow friends you can not drive them. So you can delete this group'
        else
            @group.destroy
            redirect_to student_excursion_path(excursion_id),status: 303, data:{turbo_method: :get}, notice: 'Group deleted successfully'
        end
    end
    
    private

    def group_params
        params.require(:group).permit(:description,:total_cost,:passenger_no,:user_id,:excursion_id,:suburb,:id)
    end

end
