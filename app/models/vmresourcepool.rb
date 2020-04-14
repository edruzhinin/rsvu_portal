class Vmresourcepool < ActiveRecord::Base
  belongs_to :vmhost
  has_many :vms
  has_many :child_vmresourcepool, foreign_key: :parent_id, class_name: "Vmresourcepool"
	belongs_to :parent_vmresourcepool, foreign_key: :parent_id, class_name: "Vmresourcepool"
  
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
