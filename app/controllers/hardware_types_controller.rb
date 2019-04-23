class HardwareTypesController < ApplicationController
  def index
  	@hardware_types = HardwareType.all
  end

	def edit
		@hardware_type = HardwareType.find(params[:id])
	end

  def show
		@hardware_type = HardwareType.find(params[:id])
		
	end

  def create
  	@hardware_type = HardwareType.build(hardware_model_params)
  	
  	if @hardware_type.save
			redirect_to @hardware_type
		else
		
			render 'new'
		end 
  end

  def update
  		@hardware_type = HardwareType.find(params[:id])

		if @hardware_type.update_attributes(hardware_type_params)
			redirect_to @hardware_type
		else
			render 'edit'
		end
  end
  
  def new
  	@hardware_type = HardwareType.new
  end
private
	def hardware_type_params
	  params.require(:hardware_type).permit(:name,:comment,:sparam1,:sparam2, :sparam3,:iparam1,:iparam2,:iparam3)		
	end
end
