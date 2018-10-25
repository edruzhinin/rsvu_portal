require 'rbvmomi'

class VmhostsController < ApplicationController
  def index
  	
  	vmhosts=[]
  	
  	SoftwareType.find_by(name: 'Гипервизор').softwares.each do |s|
  		vmhosts << [s.hardware.ip_adr,s.sparam1,s.sparam2]
  	end
  	
  	@vmhosts_data=[]
  	vmhosts.each do |vmhost|
  		begin
  			vim = RbVmomi::VIM.connect host: vmhost[0], insecure: true, user: vmhost[1], password: vmhost[2] 
  			datacenter = vim.serviceInstance.find_datacenter
  			@vmhosts_data << datacenter.hostFolder.childEntity
  		rescue
  			
  		end
		end  


		
  
  end

  def show
  end
end
