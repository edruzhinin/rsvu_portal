class HardwareType < ActiveRecord::Base
  has_many :hardwares
  has_many :hardware_models
  before_save :set_empty_to_null 

	private
		def set_empty_to_null
			self.sparam1 =  self.sparam1=='' ? nil : self.sparam1
			self.sparam2 =  self.sparam2=='' ? nil : self.sparam2
			self.sparam3 =  self.sparam3=='' ? nil : self.sparam3
			self.iparam1 =  self.iparam1=='' ? nil : self.iparam1
			self.iparam2 =  self.iparam2=='' ? nil : self.iparam2
			self.iparam3 =  self.iparam3=='' ? nil : self.iparam3
			
		end
	
	
	

end
