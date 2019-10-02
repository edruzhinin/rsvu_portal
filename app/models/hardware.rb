class Hardware < ActiveRecord::Base
	has_many :reservations, as: :reservable
	has_many :group_relations, as: :groupable
	has_many :groups, through: :group_relations
	has_many :devices
	has_many :softwares
	has_many :user_messages, as: :commentable
	has_many :child_hardware, foreign_key: :parent_id, class_name: "Hardware"
	belongs_to :parent_hardware, foreign_key: :parent_id, class_name: "Hardware"
	belongs_to :hardware_type
	belongs_to :hardware_model
	belongs_to :location
	belongs_to :user
	accepts_nested_attributes_for :location
	accepts_nested_attributes_for :hardware_type
	accepts_nested_attributes_for :hardware_model
	
	#scope :order_location, order("location_id desc")
	
		def reserved?
	end
	def get_hardware_full_name
		if (hardware_model)
			output = hardware_model.name
		else
			output = name
		end
		
		if (identificator)
			output = output+' ['+identificator+']'
		else
			if (serial_number)
			output = output+' sn:'+serial_number
			end
		end
	end
	
	def get_hardware_name
		if (hardware_model)
			output = hardware_model.name
		else
			output = name
		end
	end
	
	def get_hardware_identificator
		if identificator and identificator!=''
			identificator
		else
			if inv_number and inv_number!=''
				'№: '+inv_number
			else
				'sn: '+serial_number
			end	
		end
	end
	
	def get_hardware_location
		if parent_hardware
			parent_hardware.get_hardware_identificator
		else
			location.name
		end
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
	
	def self.new_from_lookup(search_string)
		where("identificator like ? or serial_number like ? or inv_number like ?", [search_string], [search_string], [search_string])
	end
end
