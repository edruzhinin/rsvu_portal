class HardwaresController < ApplicationController
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
	
	def index
		@hardwares= Hardware.includes(:hardware_reservations).joins(:hardware_type, :location).select('hardwares.id, hardwares.name, hardwares.identificator, locations.name as hw_location, hardware_types.name as hw_type').order('hw_type desc')

		
		#@hardwares = Hardware.all.order_location
	end

  private
  
  	def hardware_params
			params.require(:hardware).permit(:name)		
		end
end
