class SoftwaresController < ApplicationController
	
	
	def new
		@context=context
		@software = @context.softwares.build()
		
	end
	
	
	
	def show
		@context=context
		@software = context.softwares.find(params[:id])
	end
	
	def index
		@softwares = context.softwares
	end
	
	def destroy
		context.softwares.find(params[:id]).destroy
		redirect_to context_url(context)
		
	end
	
	def edit
		@context=context
		@software = @context.softwares.find(params[:id])
	end
	
	def update
		@context=context
		@software = @context.softwares.find(params[:id])

		if @software.update_attributes(software_params)
			redirect_to context_url(context)
		else
			render 'edit'
		end
	end
	
	
	def create
		
		@software = context.softwares.build(software_params)
		
				
		if @software.save
			redirect_to context_url(context)
		else
			
			render 'new'
		end
	end
		
	private
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
 		
 		
		def software_params
			params.require(:software).permit(:name,:software_type_id, :description, :status, :comment, :sparam1, :sparam2, :sparam3, :iparam1, :iparam2, :iparam3, :installable_id, :installable_type, :license_id)
		end
	
end