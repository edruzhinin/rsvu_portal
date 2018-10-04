class Device < ActiveRecord::Base
	belongs_to :hardware
	belongs_to :device_type
	accepts_nested_attributes_for :device_type
	validates_associated :device_type
end
