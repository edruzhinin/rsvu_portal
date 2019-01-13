class ReservationsController < ApplicationController
	 
	def new
  	@context = context
    @reservation = @context.reservations.new
  end
  
  def create
  	@context = context
    @reservation = @context.reservations.new(reservation_params)
		
    if @reservation.save
      redirect_to context_url(context), notice: "Резервирование добавлено"
    else
     render 'new'
    end
	end
	
	def destroy
		@reservation = Reservation.find(params[:id])
		
		if @reservation.reservable_type == "Vm"
			return_path = vm_path(Vm.find(@reservation.reservable_id))
		else
			return_path = hardware_path(Hardware.find(@reservation.reservable_id))
		end
		@reservation.destroy
    		
		redirect_to return_path, notice: "Резервирование удалено"
		
	end
	
#  
#	def update
#    @context = context
#    @reservation = @context.reservations.find(params[:id])
#    if @interaction.update_attributes(reservation_params)
#      redirect_to context_url(context), notice: "The interaction has been updated"
#    end
#  end
  
  
  private
  def reservation_params
    params.require(:reservation).permit(:event_id)
  end

  def context
  	if params[:vm_id]
    	id = params[:vm_id]
    	Vm.find(params[:vm_id])
    else
      id = params[:hardware_id]
      Hardware.find(params[:hardware_id])
    end
  end
  
  def context_url(context)
    if Vm === context
      vm_path(context)
    else
      hardware_path(context)
    end
  end

  
  	
	
end
