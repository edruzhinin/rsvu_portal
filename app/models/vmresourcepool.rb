class Vmresourcepool < ActiveRecord::Base
  belongs_to :vmhost
  has_many :vms
  
  
  def Vmresourcepool.status_to_s(_Status)
		case _Status
			when 1
				return "success"
    	when 2
				return "warning"
			when 3
				return "danger"
			else
				return "default"
		end
	end		
end
