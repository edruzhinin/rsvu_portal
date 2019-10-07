class HardwareModel < ActiveRecord::Base
  belongs_to :hardware_type
  has_many :hardwares
  
  def get_model_name_with_type
		hardware_type.name + ' '+name
	end
end
