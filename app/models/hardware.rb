class Hardware < ActiveRecord::Base
	has_many :hardware_reservations
	has_many :users, through: :hardware_reservations
	has_many :devices
	has_many :softwares
	belongs_to :hardware_type
	belongs_to :location
	
	#scope :order_location, order("location_id desc")
	
	def reserved?
	end
end
