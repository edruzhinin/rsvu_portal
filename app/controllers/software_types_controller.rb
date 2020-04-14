class SoftwareTypesController < ApplicationController
	def new
		@software_type = SoftwareType.new

	end
	

	def show
		@software_type = SoftwareType.find(params[:id])
	end
	
	def index
		@software_types =  SoftwareType.all
	end
	
	def destroy
		SoftwareType.find(params[:id]).destroy
		redirect_to software_types_path
		
	end
	
	def edit
		@software_type = SoftwareType.find(params[:id])
	end
	
	def update
		
		@software_type = SoftwareType.find(params[:id])

		if @software_type.update_attributes(software_type_params)
			redirect_to @software_type
		else
			render 'edit'
		end
	end
	
	
	def create
		
		@software_type = SoftwareType.new(software_type_params)
		
				
		if @software_type.save
			redirect_to software_types_path
		else
			
			render 'new'
		end
	end
	
	private
		def software_type_params
			params.require(:software_type).permit(:name,:comment, :sparam1, :sparam2, :sparam3, :iparam1, :iparam2, :iparam3, :type, :vendor_id, :commercial, :version)
		end



end
