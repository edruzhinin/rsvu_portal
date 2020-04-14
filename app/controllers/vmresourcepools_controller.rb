class VmresourcepoolsController < ApplicationController
	def edit
		@vmresourcepool = Vmresourcepool.find(params[:id])
	end
	
	def show
		@vmresourcepool = Vmresourcepool.find(params[:id])
	end
	
	def update
		
		@vmresourcepool = Vmresourcepool.find(params[:id])
		
		@vmresourcepool.creator_id = current_user

		if @vmresourcepool.update_attributes(vmresourcepool_params)
			
			redirect_to @vmresourcepool.vmhost
		else
			render 'edit'
		end
	end
	
	private
		def vmresourcepool_params
			params.require(:vmresourcepool).permit(:valid_to, :creator_id)
		end
end
