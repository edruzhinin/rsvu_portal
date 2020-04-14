class Vmhost < ActiveRecord::Base
  belongs_to :hardware
  has_many :vmresourcepools
  has_many :vms, through: :vmresourcepools
  
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
