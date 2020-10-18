class Vmhost < ActiveRecord::Base
  belongs_to :hardware
  has_many :vmresourcepools
  has_many :vmdatasources
  has_many :vms, through: :vmresourcepools
  
  def get_freespace
		freespace=0
		vmdatasources.each do |ds|
			if (ds.ds_type=="VMFS")
				freespace = freespace + ds.ds_freespace
			end
		end
		return freespace
	
	end
	
	def get_space
		space=0
		vmdatasources.each do |ds|
			if (ds.ds_type=="VMFS")
				space = space + ds.ds_capacity
			end
		end
		return space
	
	end
	
	def get_freespace_percent
		if (get_space() > 0)
			return get_freespace() * 100 / get_space()
		else
			return 0
		end
	end
  
  def Vmhost.powerstate_to_s(_powerState)
    case _powerState
    	when -2
    		return "Нет связи"
    	when -1
    		return "Выключено"
      when 1
      	return "Работает"
      when 2
      	return "В резерве"
      else
      	return "Не определено"
  		end
	end
	
	def Vmhost.powerstate_to_label(_powerState)
    case _powerState
    	when -2
    		return "danger"
    	when -1
    		return "warning"
      when 1
      	return "success"
      when 2
      	return "primary"
      else
      	return "default"
  		end
	end
end
