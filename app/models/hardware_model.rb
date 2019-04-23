class HardwareModel < ActiveRecord::Base
  belongs_to :hardware_type
  has_many :hardwares
  
end
