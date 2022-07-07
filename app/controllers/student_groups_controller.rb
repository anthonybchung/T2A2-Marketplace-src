class StudentGroupsController < ApplicationController
    before_action :authenticate_user!
    def new
        #a group has an excursion_id foreign key.
        #a the id is passed in and needs to be passed onto the view for a default value to create a new group
       @excursion_id = params[:excursion_id]
       @group = Group.new
    end

    def create
        @group = Group.new(group_params)
        #it is advised to use integers for currency.
        cost = group_params[:total_cost].to_i * 100
        #after multiplying the params in dollar to cent.
        @group.total_cost = cost

        if @group.save
            redirect_to student_excursion_path(@group.excursion_id)
        else
            redirect :new
        end
    end

    def edit
        @group = Group.find(params[:id])
        @group[:total_cost] = @group[:total_cost] /100
        @excursion_id = params[:excursion_id]
    end

    def update
       # find group
       # make a new variable to change the total cost fom Dollar to cent.
       # then update
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
        #only delete group if there is no passengers.
        #Dont want to delete a group without informing the passengers.
        if @group.passengers.length > 0
            
            redirect_to student_excursion_path(excursion_id),status: 303, data:{turbo_method: :get}, alert: 'Please inform your fellow friends you can not drive them. So you can delete this group'
        else
            @group.destroy
            redirect_to student_excursion_path(excursion_id),status: 303, data:{turbo_method: :get}, notice: 'Group deleted successfully'
        end
    end
    
    private

    def group_params
        params.require(:group).permit(:description,:total_cost,:passenger_no,:user_id,:excursion_id,:suburb,:id,:image)
    end

end
