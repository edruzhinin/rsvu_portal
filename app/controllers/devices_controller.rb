class DevicesController < ApplicationController
	before_filter :get_hardware
	
	def new
		@devices = @hardware.devices
		@device = @devices.build()
		
	end
	
	def get_hardware
		@hardware = Hardware.find(params[:hardware_id])		
	end
	
	def show
		@device = @hardware.devices.find(params[:id])
	end
	
	def index
		@devices = @hardware.devices
	end
	
	def destroy
		@hardware.devices.find(params[:id]).destroy
		redirect_to @hardware
		
	end
	
	def edit
		@device = @hardware.devices.find(params[:id])
	end
	
	def update
		
		@device = @hardware.devices.find(params[:id])

		if @device.update_attributes(device_params)
			redirect_to @hardware
		else
			render 'edit'
		end
	end
	
	
	def create
		
	@device = @hardware.devices.build(device_params)
		
				
		if @device.save
			redirect_to @hardware
		else
			
			render 'new'
		end
	end
	
	private
		def device_params
			params.require(:device).permit(:name,:device_type_id, :description, :status, :comment, :sparam1, :sparam2, :sparam3, :iparam1, :iparam2, :iparam3)
		end
	
end
