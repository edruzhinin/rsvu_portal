class Device < ActiveRecord::Base
	belongs_to :hardware
	belongs_to :device_type
end
