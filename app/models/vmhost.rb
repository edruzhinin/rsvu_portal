class Vmhost < ActiveRecord::Base
  belongs_to :hardware
  has_many :vmresourcepools
  
  def Vmhost.powerstate_to_s(_powerState)
    case _powerState
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
 end
