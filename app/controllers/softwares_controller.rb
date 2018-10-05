class SoftwaresController < ApplicationController
	before_filter :get_hardware
	
	def new
		@softwares = @hardware.softwares
		@software = @softwares.build()
		
	end
	
	def get_hardware
		@hardware = Hardware.find(params[:hardware_id])		
	end
	
	def show
		@software = @hardware.softwares.find(params[:id])
	end
	
	def index
		@softwares = @hardware.softwares
	end
	
	def destroy
		@hardware.softwares.find(params[:id]).destroy
		redirect_to @hardware
		
	end
	
	def edit
		@software = @hardware.softwares.find(params[:id])
	end
	
	def update
		
		@software = @hardware.softwares.find(params[:id])

		if @software.update_attributes(software_params)
			redirect_to @hardware
		else
			render 'edit'
		end
	end
	
	
	def create
		
		@software = @hardware.softwares.build(software_params)
		
				
		if @software.save
			redirect_to @hardware
		else
			
			render 'new'
		end
	end
	
	private
		def software_params
			params.require(:software).permit(:name,:software_type_id, :description, :status, :comment, :sparam1, :sparam2, :sparam3, :iparam1, :iparam2, :iparam3)
		end
	
end