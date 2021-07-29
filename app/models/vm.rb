class Vm < ActiveRecord::Base
  has_many :reservations, as: :reservable, dependent: :destroy
  has_many :user_messages, as: :commentable
  belongs_to :vmresourcepool
  has_one :vmhost, through: :vmresourcepool
  belongs_to :user
  belongs_to :archive

	def isActive?
		if (state==-3)
			return false
		else
			return true
		end
	end
  def get_activity
		if (valid_to)
			return valid_to.to_s+" ("+user.get_shortname+")"
		else
			if (user)
				return user.get_shortname
			else
				return "Не используется"
			end
		end
	end

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
			when -3
				return "Не найдена"
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

	def self.new_from_lookup(search_string)
		where("name like ? or uuid like ? or instance_uuid like ? or mo_id like ? or ip like ?", [search_string], [search_string], [search_string], [search_string], [search_string])
	end

end
