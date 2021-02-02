class Event < ActiveRecord::Base
  belongs_to :user
  has_many :reservations
  
  scope :active,lambda { where('to_time >= ?',Time.now.to_date)}
  scope :notactive,lambda { where('to_time < ?',Time.now.to_date)}
  
end
