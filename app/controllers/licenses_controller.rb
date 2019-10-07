class LicensesController < ApplicationController
	def new
		@license = License.new

	end
	

	def show
		@license = License.find(params[:id])
	end
	
	def index
		@licenses =  License.all
	end
	
	def destroy
		License.find(params[:id]).destroy
		redirect_to licenses_path
		
	end
	
	def edit
		@license = License.find(params[:id])
	end
	
	def update
		
		@license = License.find(params[:id])

		if @license.update_attributes(license_params)
			redirect_to @license
		else
			render 'edit'
		end
	end
	
	
	def create
		
		@license = License.new(license_params)
		
				
		if @license.save
			redirect_to licenses_path
		else
			
			render 'new'
		end
	end
	
	private
		def license_params
			params.require(:license).permit(:name,:description, :lic_type, :from_time, :to_time, :lic_count, :software_type_id)
		end
end
