class ReservationValidator < ActiveModel::Validator
  def validate(record)
    new_event = Event.find(record.event_id)
    
    conflict_res = Reservation.joins(:event).where("reservable_type=? AND reservable_id = ? AND ((events.from_time <= ? AND ? <= events.to_time) OR ( events.from_time <= ? AND ? <= events.to_time) OR (? <= events.from_time AND events.to_time <= ? ))", record.reservable_type,record.reservable_id, new_event.from_time,new_event.from_time, new_event.to_time,new_event.to_time,new_event.from_time,new_event.to_time)
    
    if conflict_res.count >0 
      record.errors[:base] << "Оборудование уже занято в период c #{new_event.from_time.to_date} по #{new_event.to_time.to_date}:"
    	
    	conflict_res.each do |conflict|
    		record.errors[:base] << "     #{conflict.event.name} с #{conflict.event.to_time.to_date} по #{conflict.event.from_time.to_date}"
    	end
    	
    	
    end
    
    
  end
end



class Reservation < ActiveRecord::Base
  belongs_to :event
  belongs_to :reservable, polymorphic: true
  accepts_nested_attributes_for :event
  
 

	validates_with ReservationValidator
  
  scope :active, -> {joins(:event).where('events.to_time >= ?',Time.now.to_date)}
  
  scope :occupied, -> {joins(:event).where('events.from_time <= ? and ? <= events.to_time',Time.now.to_date,Time.now.to_date)}
	scope :occupied_nextweek, -> {joins(:event).where('events.from_time > ? and events.from_time < ?',Time.now.to_date,1.week.from_now.to_date)}
	
	

  
end
