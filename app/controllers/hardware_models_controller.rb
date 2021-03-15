class HardwareModelsController < ApplicationController
  before_filter :get_hardware_type, except: [:show, :index, :edit, :update, :create]
  
  def get_hardware_type
		@hardware_type = HardwareType.find(params[:hardware_type_id])		
	end
  
  def create
  		
  	
  	@hardware_model = HardwareModel.new(hardware_model_params)
  	
  	if @hardware_model.save
			redirect_to @hardware_model.hardware_type
		else
		
			render 'new'
		end 
	end
  
  def show
		@hardware_model = HardwareModel.find(params[:id])
		
	end
	
	def edit
		@hardware_model = HardwareModel.find(params[:id])
	end
	
	def update
		
		@hardware_model = HardwareModel.find(params[:id])

		if @hardware_model.update_attributes(hardware_model_params)
			redirect_to @hardware_type
		else
			render 'edit'
		end
	end
	
	def index
		@hardware_models = HardwareModel.all
	end
  
  def new
    @hardware_models = @hardware_type.hardware_models
		@hardware_model =  @hardware_models.build()
    
   
  end
end
private
	def hardware_model_params
	  params.require(:hardware_model).permit(:name,:modelNo,:comment,:sparam1,:sparam2, :sparam3,:iparam1,:iparam2,:iparam3,:hardware_type_id)		
	end