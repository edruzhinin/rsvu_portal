class Hardware < ActiveRecord::Base
	has_many :reservations, as: :reservable
	has_many :devices
	has_many :softwares
	has_many :user_messages, as: :commentable
	belongs_to :hardware_type
	belongs_to :location
	belongs_to :user
	
	#scope :order_location, order("location_id desc")
	
	def reserved?
	end
	
	def get_status
		if status.nil?
			"Не определен"
		else
			if status < 0
				"Сломан"
			else
				if status > 0 
					"Недоступен"
				else
					"Доступен"
				end
			end
		end
			
	end
end
