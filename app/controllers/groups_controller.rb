class GroupsController < ApplicationController
	def new
  	@group = Group.new
  end
  
  def create
  	@group = Group.new(group_params)
  	@group.user=current_user
  	if @group.save
			redirect_to groups_path
		else
		
			render 'new'
		end 
	end
  
  def show
		@group = Group.find(params[:id])
		
		
	end
	
	def edit
		@group = Group.find(params[:id])
	end
	
	def update
		
		@group = Group.find(params[:id])

		if @group.update_attributes(group_params)
			redirect_to group_path(@group)
		else
			render 'edit'
		end
	end
	
	def index
		@groups= Group.all
 		
 		
	end

  private
  
  	def group_params
			params.require(:group).permit(:name, :description, :global, :short_name)		
		end
		
		
end
