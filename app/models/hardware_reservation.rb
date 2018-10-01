class HardwareReservation < ActiveRecord::Base
	belongs_to :hardware
	belongs_to :user
	validates :to_time, presence: { message: 'Необходимо указать дату начала'}
	validates :from_time, presence: { message: 'Необходимо указать дату окончания'}
	validates :name, presence: { message: 'Необходимо указать название'}
	validate	:isHardwareFree
	
	scope :active,lambda { where('to_time >= ?',Time.now )}
	scope :occupied, lambda { where('from_time <= ? and ? <= to_time',Time.now,Time.now)}
	scope :occupied_nextweek, lambda { where('from_time > ? and from_time < ?',Time.now,1.week.from_now)}
	
	
	def isHardwareFree
    if HardwareReservation.where("hardware_id = ? AND (from_time < ? AND ? <to_time) OR ( from_time < ? AND ? <to_time)", hardware_id, from_time,from_time, to_time,to_time).count >0 
      errors.add(:hardware_already_reserved, "Оборудование уже занято")
    end
  end
end
