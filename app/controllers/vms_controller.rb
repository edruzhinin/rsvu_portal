class VmsController < ApplicationController

	def show
		@vm = Vm.find(params[:id])
		
	end
	
	def edit
		@vm = Vm.find(params[:id])
	end
	
	def update
		@vm = Vm.find(params[:id])

		if @vm.update_attributes(vm_params)
			redirect_to @vm
		else
			render 'edit'
		end
	
	end
	
	private
	def vm_params
			params.require(:vm).permit(:user_id)		
		end
	

end
