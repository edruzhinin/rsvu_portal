class HardwareMessagesController < ApplicationController
	before_filter :get_hardware
	
	def new
		@messages = @hardware.hardware_messages
		@message = @messages.build(user: current_user)
		
	end
	
	def get_hardware
		@hardware = Hardware.find(params[:hardware_id])		
	end
	
	def show
		@message = @hardware.hardware_messages.find(params[:id])
	end
	
	def index
		@mesages = @hardware.hardware_messages
	end
	
	def destroy
		@hardware.hardware_messages.find(params[:id]).destroy
		redirect_to @hardware
		
	end
	
	def edit
		@message = @hardware.hardware_messages.find(params[:id])
	end
	
	def update
		
		@message = @hardware.hardware_messages.find(params[:id])

		if @message.update_attributes(message_params)
			redirect_to @hardware
		else
			render 'edit'
		end
	end
	
	
	def create
		@message = @hardware.hardware_messages.build(message_params)
	
		@message.user=current_user
						
		if @message.save
			redirect_to @hardware
		else
			
			render 'new'
		end
	end
	
	private
		def message_params
			params.require(:hardware_message).permit(:subject,:user_id, :body,:hardware_id)
		end
end
