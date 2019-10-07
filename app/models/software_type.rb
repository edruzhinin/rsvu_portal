class SoftwareType < ActiveRecord::Base
	has_many :softwares
	belongs_to :vendor
	
	
	def get_full_name
		name+' '+version
		
	end
end
