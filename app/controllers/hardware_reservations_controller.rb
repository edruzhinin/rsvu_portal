class HardwareReservationsController < ApplicationController
	before_filter :get_hardware
	
	def new
		@reservations = @hardware.hardware_reservations
		@reservation = @reservations.build(user: current_user)
		
	end
	
	def get_hardware
		@hardware = Hardware.find(params[:hardware_id])		
	end
	
	def show
		@reservation = @hardware.hardware_reservations.find(params[:id])
	end
	
	def index
		@reservations = @hardware.hardware_reservations
	end
	
	def create
		
	@reservation = @hardware.hardware_reservations.build(reservation_params)
		
	
	@reservation.user=current_user
		
		if @reservation.save
			redirect_to @hardware
		else
			render action: "new"
		end
	end
	
	private
		def reservation_params
			params.require(:hardware_reservation).permit(:name, :from_time, :to_time, :user_id, :hardware_id)
		end

end
