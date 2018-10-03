class HardwaresController < ApplicationController
	before_action :admin_user, only: [:edit, :update, :destroy]
  def new
  	@hardware = Hardware.new
  end
  
  def create
  	@hardware = Hardware.new(hardware_params)
  	
  	if @hardware.save
			redirect_to hardwares
		else
		
			render 'new'
		end 
	end
  
  def show
		@hardware = Hardware.find(params[:id])
		@reserves = @hardware.hardware_reservations
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
		@hardwares= Hardware.includes(:hardware_reservations).joins(:hardware_type, :location).select('hardwares.id,hardwares.status, hardwares.name, hardwares.identificator, locations.name as hw_location, hardware_types.name as hw_type').order('hw_type desc')

		
		#@hardwares = Hardware.all.order_location
	end

  private
  
  	def hardware_params
			params.require(:hardware).permit(:name,:status,:description,:model, :model_number, :serial_number,:inv_number,:identificator,:ip_adr_adm,:ip_adr,:el_power,:comment, :login, :password, :sparam1,:sparam2, :sparam3,:iparam1,:iparam2,:iparam3, :height, :place)		
		end
		
		def admin_user
			redirect_to Hardware.find(params[:id]) unless current_user.admin?
		end
end
