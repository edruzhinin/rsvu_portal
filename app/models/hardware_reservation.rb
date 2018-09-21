class HardwareReservation < ActiveRecord::Base
	belongs_to :hardware
	belongs_to :user
	validates :to_time, presence: true
	validates :from_time, presence: true
	validates :name, presence: true
	
	scope :active,lambda { where('to_time >= ?',Time.now )}
	scope :occupied, lambda { where('from_time <= ? and ? <= to_time',Time.now,Time.now)}
	scope :occupied_nextweek, lambda { where('from_time > ? and from_time < ?',Time.now,1.week.from_now)}
end
