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

	def search
		if params[:selection].blank?
			flash.now[:danger]="Необходимо ввести критерий поиска"
		else
			@vms=Vm.new_from_lookup(params[:selection])

			flash.now[:danger]= "Ничего не найдено" unless @vms.size > 0

		end


		render partial: 'vms/result'


	end

	private
	def vm_params
			params.require(:vm).permit(:user_id, :archive_id, :use_type, :valid_to, :always_on)		
		end


end
