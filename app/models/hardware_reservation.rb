class HardwareReservation < ActiveRecord::Base
	belongs_to :hardware
	belongs_to :user
	
	scope :active,lambda { where('to_time >= ?',Time.now )}
	scope :occupied, lambda { where('from_time <= ? and ? <= to_time',Time.now,Time.now)}
end
