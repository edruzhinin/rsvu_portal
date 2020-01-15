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
	
	def destroy
		vm = Vm.find(params[:id])
		
		vmhost= vm.vmresourcepool.vmhost
		
		if (vm.state != -3) 
			flash[:danger]=  "Невозможно удалить активную VM"	
			redirect_to vm
		else
			vm.destroy
    	flash[:danger]=  "Виртуальная машина удалена"		
			redirect_to vmhost
		end
	end
	
	private
	def vm_params
			params.require(:vm).permit(:user_id)		
		end
	

end
