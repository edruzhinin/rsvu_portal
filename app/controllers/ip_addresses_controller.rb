class IpAddressesController < ApplicationController
#	def new
#		@archive = Archive.new
#	end
	

	def show
		@ip_address = IpAddress.find(params[:id])
	end
	
	def index
		@ip_addresses =  IpAddress.all
	end
	
#	def destroy
#		Archive.find(params[:id]).destroy
#		redirect_to licenses_path
#		
#	end
#	
#	def edit
#		@archive = Archive.find(params[:id])
#	end
#	
#	def update
#		
#		@archive = Archive.find(params[:id])
#
#		if @archive.update_attributes(archive_params)
#			redirect_to @archive
#		else
#			render 'edit'
#		end
#	end
#	
#	
#	def create
#		
#		@archive = Archive.new(archive_params)
#		
#				
#		if @archive.save
#			redirect_to archives_path
#		else
#			
#			render 'new'
#		end
#	end
#	
#	private
#		def archive_params
#			params.require(:archive).permit(:name,:description)
#		end
	
end