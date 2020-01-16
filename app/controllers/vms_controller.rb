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
	
	def archive
		@vm = Vm.find(params[:id])
		
		if (@vm.state != -3) 
			flash[:danger]=  "Невозможно архивировать активную VM"	
			redirect_to request.referrer
		
		end
	end
	
	def destroy
		vm = Vm.find(params[:id])
		
		vmhost= vm.vmresourcepool.vmhost
		
		if (vm.state != -3) 
			flash[:danger]=  "Невозможно удалить активную VM"	
			redirect_to request.referrer
		else
			vm.destroy
    	flash[:danger]=  "Виртуальная машина удалена"		
			redirect_to vmhost
		end
	end
	
	private
	def vm_params
			params.require(:vm).permit(:user_id, :archive_id)		
		end
	

end
