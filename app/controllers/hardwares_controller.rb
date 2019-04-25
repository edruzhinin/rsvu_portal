class HardwaresController < ApplicationController
	before_action :admin_user, only: [:edit, :update, :destroy]
  def new
  	@hardware = Hardware.new
  	
  	if(params.has_key?(:hardware_type_id)) 
  		@hardware_type = HardwareType.find(params[:hardware_type_id])
  		@hardware.hardware_type = @hardware_type
  	end
  		
  	if(params.has_key?(:hardware_model_id))
  		@hardware_model = HardwareModel.find(params[:hardware_model_id])
  		@hardware.hardware_model = @hardware_model
  	end
  	
  	
  	
  	
  end
  
  def create
  	@hardware = Hardware.new(hardware_params)
  	
  	if @hardware.save
			redirect_to @hardware
		else
		
			render 'new'
		end 
	end
  
  def show
		@hardware = Hardware.find(params[:id])
		
	end
	
	def edit
		@hardware = Hardware.find(params[:id])
	end
	
	def update
		
		@hardware = Hardware.find(params[:id])

		if @hardware.update_attributes(hardware_params)
			redirect_to @hardware
		else
			render 'edit'
		end
	end
	
	def index
		@hardwares = Hardware.all
	end
	
	
  private
  
  	def hardware_params
			params.require(:hardware).permit(:name,:canBook,:parent_id,:hardware_type_id,:hardware_model_id,:status,:description,:model, :model_number, :serial_number,:inv_number,:identificator,:location_id,:ip_adr_adm,:ip_adr,:el_power,:comment, :login, :password, :sparam1,:sparam2, :sparam3,:iparam1,:iparam2,:iparam3, :height, :place)		
		end
		
		def admin_user
			redirect_to Hardware.find(params[:id]) unless current_user.admin?
		end
end
