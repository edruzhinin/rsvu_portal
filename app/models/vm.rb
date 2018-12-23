class Vm < ActiveRecord::Base
  has_many :reservations, as: :reservable
  belongs_to :vmresourcepool
  belongs_to :user
  
  
  
	def Vm.tools_status_to_s(_tools_status)
  	case _tools_status
  		when -1
  			return "Не установлены"
  		when 1
  			return "Ок"
  		when 0
  			return "Не запущены"
  		when 2
  			return "Устарели"
  		else
  			return "Не определено"
  	end
	end
  	
    	  
	def Vm.powerstate_to_s(_powerState)
		case _powerState
			when -1
				return "Выключена"
    	when 1
				return "Работает"
			when 2
				return "Приостановлена"
			else
				return "Не определено"
		end
	end		
	
	def Vm.powerstate_to_label(_powerState)
    case _powerState
    	
    	when -1
    		return "warning"
      when 1
      	return "success"
      when 2
      	return "info"
      else
      	return "default"
  		end
	end
	
end
